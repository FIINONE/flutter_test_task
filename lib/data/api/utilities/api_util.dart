// import 'package:flutter_test_task/data/api/models/user.dart';
import 'package:flutter_test_task/data/api/models/posts/post.dart';
import 'package:flutter_test_task/data/api/models/users/user.dart';
import 'package:flutter_test_task/data/api/services/api_post_service.dart';
import 'package:flutter_test_task/data/api/services/api_user_service.dart';
import 'package:flutter_test_task/data/mapper/post_mapper.dart';
import 'package:flutter_test_task/data/mapper/user_mapper.dart';
import 'package:flutter_test_task/domain/model/post.dart';
import 'package:flutter_test_task/domain/model/user.dart';

class ApiUserUtil {
  final ApiUserGet _apiTypecode;

  ApiUserUtil(this._apiTypecode);

  Future<List<User>> getUsers() async {
    final List<ApiUser>? apiUser = await _apiTypecode.getApiUsers();
    final List<User> users =
        apiUser!.map((ApiUser apiUser) => UserMapper.mapper(apiUser)).toList();
    return users;
  }
}

class ApiPostUtil {
  final ApiPostGet _apiPostGet;

  ApiPostUtil(this._apiPostGet);

  Future<List<Post>> getPosts(Map<String, String> userId) async {
    final List<ApiPost>? apiPosts = await _apiPostGet.getPosts(userId);
    final List<Post> posts =
        apiPosts!.map((apiPost) => PostMapper.mapper(apiPost)).toList();
    return posts;
  }
}
