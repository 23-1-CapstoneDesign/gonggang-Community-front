import 'package:flutter/material.dart';
import 'community_post_detail.dart';

// 게시글 목록 페이지
// 추후 데이터 베이스와 연동
class BoardPostsPage extends StatelessWidget {
  final String boardName;

  const BoardPostsPage({Key? key, required this.boardName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(boardName),
      ),
      body: ListView.builder(
        itemCount: 10, // 임시 데이터로 10개만 보여주도록 설정
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('게시글 ${index + 1}'),
            subtitle: Text('게시글 ${index + 1}의 내용입니다.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BoardPostDetailPage(
                    boardName: boardName,
                    postId: index + 1,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// 게시판 목록 페이지
class BoardListPage extends StatelessWidget {
  const BoardListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시판 목록'),
      ),
      body: ListView(
        children: <Widget>[
          _buildListItem(
              context, '자유 게시판', () => _showBoardPosts(context, '자유 게시판')),
          Divider(),
          _buildListItem(
              context, '중고 거래', () => _showBoardPosts(context, '중고 거래')),
          Divider(),
          _buildListItem(
              context, '청년 정책', () => _showBoardPosts(context, '청년 정책')),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String title, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(Icons.arrow_right),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBoardPosts(BuildContext context, String boardName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BoardPostsPage(boardName: boardName),
      ),
    );
  }
}
