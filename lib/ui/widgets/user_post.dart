import 'package:flutter/material.dart';
import 'package:flutter_test_task/domain/model/post.dart';
import 'package:provider/provider.dart';

import 'package:flutter_test_task/domain/provider/post_provider.dart';

class UserListPostsPreview extends StatelessWidget {
  final int userId;

  const UserListPostsPreview({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postModel = context.read<PostProvider>().getPost(userId);
    return SizedBox(
      height: 300,
      child: FutureBuilder<List<Post>>(
        future: postModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (context, int index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(
                    snapshot.data![index].body,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
