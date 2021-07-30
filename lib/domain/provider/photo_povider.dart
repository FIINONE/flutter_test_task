import 'dart:developer';

import 'package:flutter_test_task/domain/model/photo.dart';
import 'package:flutter_test_task/domain/repository/repository.dart';

class PhotoProvider {
  PhotoRepository? _photoRepository;

  PhotoProvider(this._photoRepository);

  Future<List<Photo>> getPhotos(int id) async {
    final Map<String, String> albumId = {
      'albumId': id.toString(),
    };

    final photos = await _photoRepository!.getPhotos(albumId);
    return photos;
  }
}
