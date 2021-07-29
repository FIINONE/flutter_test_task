import 'package:flutter/material.dart';
import 'package:flutter_test_task/domain/model/comment.dart';
import 'package:flutter_test_task/domain/provider/comment_provider.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatelessWidget {
  static const String comments = '/users/user/comments';
  final int postId;

  const CommentsScreen({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commentsModel = context.read<CommentProvider>().getComments(postId);
    return Scaffold(
      body: FutureBuilder<List<Comment>>(
        future: commentsModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(
                    snapshot.data![index].email,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                );
              },
              separatorBuilder: (context, int index) {
                return const Divider();
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
