import 'dart:convert';

import 'package:flutter_test_task/data/api/models/posts/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiPostCacheGet {
  final _shared = SharedPreferences.getInstance();

  Future<void> setPostCache(String key, String body) async {
    final shared = await _shared;
    shared.setString(key, body);
  }

  Future<List<ApiPost>?> getPostCache(int userId) async {
    final String key = 'post_userId_$userId';
    final shared = await _shared;
    final String? body = shared.getString(key);
    if (body != null) {
      final list = json.decode(body) as List<dynamic>;
      final apialbums = list
          .map((dynamic json) => ApiPost.fromJson(json as Map<String, dynamic>))
          .toList();
      return apialbums;
    }
  }

  Future<bool> containsKey(int userId) async {
    final String key = 'post_userId_$userId';
    final SharedPreferences shared = await _shared;
    return shared.containsKey(key);
  }
}
