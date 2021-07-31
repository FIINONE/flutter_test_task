import 'dart:convert';

import 'package:flutter_test_task/data/api/models/photos/photo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiPhotoCacheGet {
  final _shared = SharedPreferences.getInstance();

  Future<void> setCommentCache(String key, String body) async {
    final shared = await _shared;
    await shared.setString(key, body);
  }

  Future<List<ApiPhoto>?> getPhotosCache(int albumId) async {
    final String key = 'photo_albumId$albumId';
    final shared = await _shared;
    final String? body = shared.getString(key);
    if (body != null) {
      final list = json.decode(body) as List<dynamic>;
      final apiPhotos = list
          .map(
              (dynamic json) => ApiPhoto.fromJson(json as Map<String, dynamic>))
          .toList();
      return apiPhotos;
    }
  }

  Future<bool> containsKey(int albumId) async {
    final String key = 'photo_albumId$albumId';
    final SharedPreferences shared = await _shared;
    return shared.containsKey(key);
  }
}
