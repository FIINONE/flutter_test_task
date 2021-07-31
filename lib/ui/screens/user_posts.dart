import 'package:flutter/material.dart';
import 'package:flutter_test_task/domain/model/post.dart';
import 'package:provider/provider.dart';

import 'package:flutter_test_task/domain/provider/post_provider.dart';

class UserPostsScreen extends StatelessWidget {
  final int userIndex;

  const UserPostsScreen({
    Key? key,
    required this.userIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postModel = context.read<PostProvider>().getPost(userIndex);
    return FutureBuilder<List<Post>>(
      future: postModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, int index) {
              return ListTile(
                leading: const Icon(Icons.article),
                title: Text(snapshot.data![index].title),
                subtitle: Text(
                  snapshot.data![index].body,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
                onTap: () => context.read<PostProvider>().showComments(
                      context,
                      snapshot.data![index].id,
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
    );
  }
}
