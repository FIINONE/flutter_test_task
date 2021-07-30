import 'dart:convert';
import 'dart:developer';
import 'package:flutter_test_task/data/api/data_cache/photo_cache.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_test_task/data/api/services/constants.dart';
import 'package:flutter_test_task/data/api/models/photos/photo.dart';

class ApiPhotoGet {
  Future<List<ApiPhoto>?> getPhotos(int albumId) async {
    final String key = 'photo_albumId$albumId';
    final Map<String, String> quiryParam = {'albumId': albumId.toString()};

    final uri =
        Uri.https(Constants.authority, Constants.photosPath, quiryParam);
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final String body = response.body;
        ApiPhotoCacheGet().setCommentCache(key, body);

        final list = json.decode(body) as List<dynamic>;
        final photos = list
            .map((dynamic post) =>
                ApiPhoto.fromJson(post as Map<String, dynamic>))
            .toList();
        log('$photos');
        return photos;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
