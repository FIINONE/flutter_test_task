import 'dart:convert';
import 'dart:developer';

import 'package:flutter_test_task/data/api/data_cache/album_cache.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_test_task/data/api/models/albums/album.dart';
import 'package:flutter_test_task/data/api/services/constants.dart';

class ApiAlbumGet {
  Future<List<ApiAlbum>?> getAlbums(int userId) async {
    final String key = 'album_userId_$userId';

    final Map<String, String> quiryParam = <String, String>{
      'userId': userId.toString(),
    };

    final Uri uri =
        Uri.https(Constants.authority, Constants.albumsPath, quiryParam);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final String body = response.body;
        ApiAlbumCacheGet().setAlbumCache(key, body);

        final list = json.decode(body) as List<dynamic>;
        final albums = list
            .map((dynamic post) =>
                ApiAlbum.fromJson(post as Map<String, dynamic>))
            .toList();
        log('$albums');
        return albums;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
