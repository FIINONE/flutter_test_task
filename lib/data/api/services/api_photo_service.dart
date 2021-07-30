import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter_test_task/data/api/services/constants.dart';
import 'package:flutter_test_task/data/api/models/photos/photo.dart';

class ApiPhotoGet {
  Future<List<ApiPhoto>?> getPhotos(
    Map<String, String> albumId,
  ) async {
    final Map<String, String> quiryParam = albumId;

    final uri =
        Uri.https(Constants.authority, Constants.photosPath, quiryParam);
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final list = json.decode(response.body) as List<dynamic>;
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
