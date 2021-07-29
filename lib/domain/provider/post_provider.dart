import 'package:flutter/cupertino.dart';
import 'package:flutter_test_task/domain/model/post.dart';
import 'package:flutter_test_task/domain/repository/repository.dart';
import 'package:flutter_test_task/ui/screens/user_comments.dart';

class PostProvider {
  PostRepository? _postRepository;

  PostProvider(this._postRepository);

  Future<List<Post>> getPost(int userIndex) async {
    final Map<String, String> userId = <String, String>{
      'userId': userIndex.toString()
    };
    final List<Post> posts = await _postRepository!.getPosts(userId);
    return posts;
  }

  void showComments(BuildContext context, int postId) {
    Navigator.of(context).pushNamed(CommentsScreen.comments, arguments: postId);
  }
}
