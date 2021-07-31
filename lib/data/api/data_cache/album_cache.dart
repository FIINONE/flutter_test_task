import 'dart:convert';

import 'package:flutter_test_task/data/api/models/albums/album.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiAlbumCacheGet {
  final _shared = SharedPreferences.getInstance();

  Future<void> setAlbumCache(String key, String body) async {
    final shared = await _shared;
    await shared.setString(key, body);
  }

  Future<List<ApiAlbum>?> getAlbumsCache(int userId) async {
    final String key = 'album_userId_$userId';
    final shared = await _shared;
    final String? body = shared.getString(key);
    if (body != null) {
      final list = json.decode(body) as List<dynamic>;
      final apialbums = list
          .map(
              (dynamic json) => ApiAlbum.fromJson(json as Map<String, dynamic>))
          .toList();
      return apialbums;
    }
  }

  Future<bool> containsKey(int userId) async {
    final String key = 'album_userId_$userId';
    final SharedPreferences shared = await _shared;
    return shared.containsKey(key);
  }
}
