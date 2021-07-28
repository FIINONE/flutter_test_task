import 'package:flutter_test_task/domain/model/post.dart';
import 'package:flutter_test_task/domain/model/user.dart';
import 'package:flutter_test_task/domain/repository/repository.dart';

class PostProvider {
  PostRepository? _postRepository;

  PostProvider(this._postRepository);

  Future<List<Post>> getPost(int user) async {
    final Map<String, String> userId = <String, String>{
      'userId': user.toString()
    };
    final List<Post> posts = await _postRepository!.getPosts(userId);
    return posts;
  }
}
