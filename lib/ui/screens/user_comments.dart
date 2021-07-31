import 'package:flutter/material.dart';
import 'package:flutter_test_task/domain/model/comment.dart';
import 'package:flutter_test_task/domain/provider/comment_provider.dart';
import 'package:flutter_test_task/ui/widgets/comment_form.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatelessWidget {
  static const String comments = '/users/user/post/comments';
  final int postId;

  const CommentsScreen({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<List<Comment>> commentsModel;
    // final List<Comment> model = context.watch<CommentProvider>().comments!;
    // commentsModel = Future<List<Comment>>.value(model);
    commentsModel = context.watch<CommentProvider>().getComments(postId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User`s Comments'),
      ),
      body: FutureBuilder<List<Comment>>(
        future: commentsModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, int index) {
                return ExpansionTile(
                  title: Text('Name: ${snapshot.data![index].name}'),
                  subtitle: Text(
                    'Email: ${snapshot.data![index].email}',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                  childrenPadding: const EdgeInsets.only(
                      left: 16.0, bottom: 8.0, right: 16.0),
                  expandedAlignment: Alignment.topLeft,
                  children: [
                    Text(
                      snapshot.data![index].body,
                      textAlign: TextAlign.start,
                    ),
                  ],
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
      floatingActionButton: CommentSendForm(
        postIndex: postId,
      ),
    );
  }
}
