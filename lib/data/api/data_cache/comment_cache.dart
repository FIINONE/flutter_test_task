import 'dart:convert';

import 'package:flutter_test_task/data/api/models/comments/comment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiCommentCacheGet {
  final _shared = SharedPreferences.getInstance();

  Future<void> setCommentCache(String key, String body) async {
    final shared = await _shared;
    shared.setString(key, body);
  }

  Future<List<ApiComment>?> getCommentCache(int postId) async {
    final String key = 'comment_postId$postId';
    final shared = await _shared;
    final String? body = shared.getString(key);
    if (body != null) {
      final list = json.decode(body) as List<dynamic>;
      final apicomments = list
          .map((dynamic json) =>
              ApiComment.fromJson(json as Map<String, dynamic>))
          .toList();
      return apicomments;
    }
  }

  Future<bool> containsKey(int postId) async {
    final String key = 'comment_postId$postId';
    final SharedPreferences shared = await _shared;
    return shared.containsKey(key);
  }
}
