import 'dart:convert';
import 'dart:developer';

import 'package:flutter_test_task/data/api/data_cache/post_cache.dart';
import 'package:flutter_test_task/data/api/models/posts/post.dart';
import 'package:flutter_test_task/data/api/services/constants.dart';
import 'package:http/http.dart' as http;

class ApiPostGet {
  Future<List<ApiPost>?> getPosts(int userId) async {
    final String key = 'post_userId_$userId';
    final Map<String, String> queryParam = <String, String>{
      'userId': userId.toString(),
    };

    final Uri uri =
        Uri.https(Constants.authority, Constants.postsPath, queryParam);
    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        final String body = response.body;
        ApiPostCacheGet().setPostCache(key, body);

        final postList = json.decode(body) as List<dynamic>;

        final posts = postList
            .map((dynamic post) =>
                ApiPost.fromJson(post as Map<String, dynamic>))
            .toList();
        log('$posts');
        return posts;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
