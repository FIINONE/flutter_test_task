import 'package:flutter_test_task/data/api/utilities/api_util.dart';
import 'package:flutter_test_task/domain/model/album.dart';
import 'package:flutter_test_task/domain/model/photo.dart';
import 'package:flutter_test_task/domain/model/post.dart';
import 'package:flutter_test_task/domain/model/user.dart';
import 'package:flutter_test_task/domain/repository/repository.dart';

class UserDataRepository extends UserRepository {
  final ApiUserUtil? _apiUtil;

  UserDataRepository(this._apiUtil);

  @override
  Future<List<User>> getUsers() {
    return _apiUtil!.getUsers();
  }
}

class PostDataRepository extends PostRepository {
  final ApiPostUtil? _apiPostUtil;

  PostDataRepository(this._apiPostUtil);

  @override
  Future<List<Post>> getPosts(Map<String, String> userId) {
    return _apiPostUtil!.getPosts(userId);
  }
}

class AlbumDataRepository extends AlbumRepository {
  final ApiAlbumUtil? _apiAlbumUtil;

  AlbumDataRepository(this._apiAlbumUtil);

  @override
  Future<List<Album>> getAlbums(Map<String, String> userId) {
    return _apiAlbumUtil!.getAlbums(userId);
  }
}

class PhotoDataRepository extends PhotoRepository {
  final ApiPhotoUtil? _apiPhotoUtil;

  PhotoDataRepository(this._apiPhotoUtil);

  @override
  Future<List<Photo>> getPhotos(Map<String, String> albumId) {
    return _apiPhotoUtil!.getPhotoAlbumPreview(albumId);
  }
}
