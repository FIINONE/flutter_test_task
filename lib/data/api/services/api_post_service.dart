import 'dart:convert';
import 'dart:developer';

import 'package:flutter_test_task/data/api/models/posts/post.dart';
import 'package:http/http.dart' as http;

class ApiPostGet {
  Future<List<ApiPost>?> getPosts(Map<String, String> userId) async {
    const String authority = 'jsonplaceholder.typicode.com';
    const String unencodedPath = '/posts';
    final Map<String, String> queryParam = userId;

    final Uri uri = Uri.https(authority, unencodedPath, queryParam);
    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        final postList = json.decode(response.body) as List<dynamic>;

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
