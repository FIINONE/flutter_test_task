import 'package:flutter/cupertino.dart';
import 'package:flutter_test_task/domain/model/album.dart';
import 'package:flutter_test_task/domain/repository/repository.dart';
import 'package:flutter_test_task/ui/screens/user_photos.dart';

class AlbumProvider {
  AlbumRepository? _albumRepository;

  AlbumProvider(this._albumRepository);

  Future<List<Album>> getAlbums(int userId) async {
    final albums = await _albumRepository!.getAlbums(userId);
    return albums;
  }

  void showPhotos(BuildContext context, int albumId) {
    Navigator.of(context).pushNamed(PhotosScreen.photos, arguments: albumId);
  }
}
