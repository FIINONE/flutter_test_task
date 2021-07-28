import 'package:flutter_test_task/domain/model/post.dart';
import 'package:flutter_test_task/domain/model/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}

abstract class PostRepository {
  Future<List<Post>> getPosts(Map<String, String> userId);
}
