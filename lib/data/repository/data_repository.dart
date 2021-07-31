import 'package:flutter_test_task/data/api/api_util.dart';
import 'package:flutter_test_task/data/api/data_cache/user_cache.dart';
import 'package:flutter_test_task/domain/model/album.dart';
import 'package:flutter_test_task/domain/model/comment.dart';
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
  Future<List<Post>> getPosts(int userId) {
    return _apiPostUtil!.getPosts(userId);
  }
}

class AlbumDataRepository extends AlbumRepository {
  final ApiAlbumUtil? _apiAlbumUtil;

  AlbumDataRepository(this._apiAlbumUtil);

  @override
  Future<List<Album>> getAlbums(int userId) {
    return _apiAlbumUtil!.getAlbums(userId);
  }
}

class PhotoDataRepository extends PhotoRepository {
  final ApiPhotoUtil? _apiPhotoUtil;

  PhotoDataRepository(this._apiPhotoUtil);

  @override
  Future<List<Photo>> getPhotos(int albumId) {
    return _apiPhotoUtil!.getPhotos(albumId);
  }
}

class CommentDataRepository extends CommentRepository {
  final ApiCommentUtil? _apiCommentUtil;

  CommentDataRepository(this._apiCommentUtil);

  @override
  Future<List<Comment>> getCommets(int postId) {
    return _apiCommentUtil!.getComments(postId);
  }

  @override
  Future<void> postComment(
      int postIndex, String name, String email, String body) async {
    _apiCommentUtil!.postComment(postIndex, name, email, body);
  }
}
