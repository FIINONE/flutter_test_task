import 'package:flutter_test_task/data/api/models/albums/album.dart';
import 'package:flutter_test_task/domain/model/album.dart';

class AlbumMapper {
  static Album mapper(ApiAlbum apiAlbum) {
    return Album(
        id: apiAlbum.id!, title: apiAlbum.title!, userId: apiAlbum.userId!);
  }
}
