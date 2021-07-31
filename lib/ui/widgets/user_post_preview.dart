import 'package:flutter/material.dart';
import 'package:flutter_test_task/domain/model/post.dart';
import 'package:provider/provider.dart';

import 'package:flutter_test_task/domain/provider/post_provider.dart';

class UserPostsPreview extends StatelessWidget {
  final int userId;

  const UserPostsPreview({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<List<Post>> postModel =
        context.read<PostProvider>().getPost(userId);
    return FutureBuilder<List<Post>>(
      future: postModel,
      builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.article),
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
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
