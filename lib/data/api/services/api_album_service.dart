import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:flutter_test_task/data/api/models/albums/album.dart';
import 'package:flutter_test_task/data/api/services/constants.dart';

class ApiAlbumGet {
  Future<List<ApiAlbum>?> getAlbumPreview(Map<String, String> userId) async {
    final Map<String, String> quiryParam = userId;

    final Uri uri =
        Uri.https(Constants.authority, Constants.albumsPath, quiryParam);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final list = json.decode(response.body) as List<dynamic>;
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
