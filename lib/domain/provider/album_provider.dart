import 'package:flutter_test_task/domain/model/album.dart';
import 'package:flutter_test_task/domain/repository/repository.dart';

class AlbumProvider {
  AlbumRepository? _albumRepository;

  AlbumProvider(this._albumRepository);

  Future<List<Album>> getAlbums(int id) async {
    final Map<String, String> userId = {'userId': id.toString()};

    final albums = await _albumRepository!.getAlbums(userId);
    return albums;
  }
}
