// import 'package:flutter_test_task/data/api/models/user.dart';
import 'package:flutter_test_task/data/api/models/albums/album.dart';
import 'package:flutter_test_task/data/api/models/photos/photo.dart';
import 'package:flutter_test_task/data/api/models/posts/post.dart';
import 'package:flutter_test_task/data/api/models/users/user.dart';
import 'package:flutter_test_task/data/api/services/api_album_service.dart';
import 'package:flutter_test_task/data/api/services/api_comment_service.dart';
import 'package:flutter_test_task/data/api/services/api_photo_service.dart';
import 'package:flutter_test_task/data/api/services/api_post_service.dart';
import 'package:flutter_test_task/data/api/services/api_user_service.dart';
import 'package:flutter_test_task/data/mapper/album_mapper.dart';
import 'package:flutter_test_task/data/mapper/comment_mapper.dart';
import 'package:flutter_test_task/data/mapper/photo_mapper.dart';
import 'package:flutter_test_task/data/mapper/post_mapper.dart';
import 'package:flutter_test_task/data/mapper/user_mapper.dart';
import 'package:flutter_test_task/domain/model/album.dart';
import 'package:flutter_test_task/domain/model/comment.dart';
import 'package:flutter_test_task/domain/model/photo.dart';
import 'package:flutter_test_task/domain/model/post.dart';
import 'package:flutter_test_task/domain/model/user.dart';

class ApiUserUtil {
  final ApiUserGet _apiTypecode;

  ApiUserUtil(this._apiTypecode);

  Future<List<User>> getUsers() async {
    final List<ApiUser>? apiUser = await _apiTypecode.getApiUsers();
    final List<User> users =
        apiUser!.map((ApiUser apiUser) => UserMapper.mapper(apiUser)).toList();
    return users;
  }
}

class ApiPostUtil {
  final ApiPostGet _apiPostGet;

  ApiPostUtil(this._apiPostGet);

  Future<List<Post>> getPosts(Map<String, String> userId) async {
    final List<ApiPost>? apiPosts = await _apiPostGet.getPosts(userId);
    final List<Post> posts =
        apiPosts!.map((apiPost) => PostMapper.mapper(apiPost)).toList();
    return posts;
  }
}

class ApiAlbumUtil {
  final ApiAlbumGet _apiAlbumGet;

  ApiAlbumUtil(this._apiAlbumGet);

  Future<List<Album>> getAlbums(Map<String, String> userId) async {
    final List<ApiAlbum>? apiAlbums =
        await _apiAlbumGet.getAlbumPreview(userId);
    final List<Album> albums =
        apiAlbums!.map((apiAlbum) => AlbumMapper.mapper(apiAlbum)).toList();
    return albums;
  }
}

class ApiPhotoUtil {
  final ApiPhotoGet _apiPhotoGet;

  ApiPhotoUtil(this._apiPhotoGet);

  Future<List<Photo>> getPhotoAlbumPreview(Map<String, String> albumId) async {
    final List<ApiPhoto>? apiPhotos =
        await _apiPhotoGet.getAlbumPhotoPreview(albumId);

    final List<Photo> photos =
        apiPhotos!.map((apiPhoto) => PhotoMapper.mapper(apiPhoto)).toList();
    return photos;
  }
}

class ApiCommentUtil {
  final ApiCommentGet _apiCommentGet;

  ApiCommentUtil(this._apiCommentGet);

  Future<List<Comment>> getComments(Map<String, String> postId) async {
    final apiComments = await _apiCommentGet.getCommits(postId);

    final List<Comment> commets = apiComments!
        .map((apiCompany) => ApiCommentMappper.mapper(apiCompany))
        .toList();
    return commets;
  }
}
