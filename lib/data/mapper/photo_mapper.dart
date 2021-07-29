import 'package:flutter_test_task/data/api/models/photos/photo.dart';
import 'package:flutter_test_task/domain/model/photo.dart';

class PhotoMapper {
  static Photo mapper(ApiPhoto apiPhoto) {
    return Photo(
      id: apiPhoto.id!,
      thumbnailUrl: apiPhoto.thumbnailUrl!,
      albumId: apiPhoto.albumId!,
      title: apiPhoto.title!,
      url: apiPhoto.url!,
    );
  }
}
