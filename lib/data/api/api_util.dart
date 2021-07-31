import 'package:flutter_test_task/data/api/data_cache/album_cache.dart';
import 'package:flutter_test_task/data/api/data_cache/comment_cache.dart';
import 'package:flutter_test_task/data/api/data_cache/photo_cache.dart';
import 'package:flutter_test_task/data/api/data_cache/post_cache.dart';
import 'package:flutter_test_task/data/api/data_cache/user_cache.dart';
import 'package:flutter_test_task/data/api/models/albums/album.dart';
import 'package:flutter_test_task/data/api/models/comments/comment.dart';
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
  final ApiUserGet _apiUserGet;
  final ApiUserCacheGet _userCacheGet;

  ApiUserUtil(this._apiUserGet, this._userCacheGet);

  Future<List<User>> getUsers() async {
    List<ApiUser>? _apiUser;
    final bool containsKey = await _userCacheGet.containsKey();
    if (containsKey == true) {
      _apiUser = await _userCacheGet.getUserCache();
    }
    _apiUser ??= await _apiUserGet.getApiUsers();
    final List<User> users =
        _apiUser!.map((ApiUser apiUser) => UserMapper.mapper(apiUser)).toList();
    return users;
  }
}

class ApiPostUtil {
  final ApiPostGet _apiPostGet;
  final ApiPostCacheGet _apiPostCacheGet;

  ApiPostUtil(this._apiPostGet, this._apiPostCacheGet);

  Future<List<Post>> getPosts(int userId) async {
    List<ApiPost>? apiPosts;
    final bool containsKey = await _apiPostCacheGet.containsKey(userId);
    if (containsKey == true) {
      apiPosts = await _apiPostCacheGet.getPostCache(userId);
    }
    apiPosts ??= await _apiPostGet.getPosts(userId);
    final List<Post> posts =
        apiPosts!.map((ApiPost apiPost) => PostMapper.mapper(apiPost)).toList();
    return posts;
  }
}

class ApiAlbumUtil {
  final ApiAlbumGet _apiAlbumGet;
  final ApiAlbumCacheGet _albumCacheGet;

  ApiAlbumUtil(this._apiAlbumGet, this._albumCacheGet);

  Future<List<Album>> getAlbums(int userId) async {
    List<ApiAlbum>? apiAlbums;
    final bool containsKey = await _albumCacheGet.containsKey(userId);
    if (containsKey == true) {
      apiAlbums = await _albumCacheGet.getAlbumsCache(userId);
    }
    apiAlbums ??= await _apiAlbumGet.getAlbums(userId);

    final List<Album> albums = apiAlbums!
        .map((ApiAlbum apiAlbum) => AlbumMapper.mapper(apiAlbum))
        .toList();
    return albums;
  }
}

class ApiPhotoUtil {
  final ApiPhotoGet _apiPhotoGet;
  final ApiPhotoCacheGet _apiPhotoCacheGet;

  ApiPhotoUtil(this._apiPhotoGet, this._apiPhotoCacheGet);

  Future<List<Photo>> getPhotos(int albumId) async {
    List<ApiPhoto>? apiPhotos;
    final bool containsKey = await _apiPhotoCacheGet.containsKey(albumId);
    if (containsKey == true) {
      apiPhotos = await _apiPhotoCacheGet.getPhotosCache(albumId);
    }
    apiPhotos ??= await _apiPhotoGet.getPhotos(albumId);

    final List<Photo> photos = apiPhotos!
        .map((ApiPhoto apiPhoto) => PhotoMapper.mapper(apiPhoto))
        .toList();
    return photos;
  }
}

class ApiCommentUtil {
  final ApiCommentGet _apiCommentGet;
  final ApiCommentCacheGet _apiCommentCacheGet;

  ApiCommentUtil(this._apiCommentGet, this._apiCommentCacheGet);

  Future<List<Comment>> getComments(
    int postId,
  ) async {
    List<ApiComment>? apiComments;
    final bool containsKey = await _apiCommentCacheGet.containsKey(postId);
    if (containsKey == true) {
      apiComments = await _apiCommentCacheGet.getCommentCache(postId);
    }
    apiComments ??= await _apiCommentGet.getCommits(postId);

    ApiComment? fakeComment;
    final bool fakeCommentKey =
        await _apiCommentCacheGet.containsFakeKey(postId);
    if (fakeCommentKey == true) {
      fakeComment = await _apiCommentCacheGet.getFakeCommentCache(postId);
      apiComments!.add(fakeComment!);
    }

    final List<Comment> commets = apiComments!
        .map((ApiComment apiCompany) => ApiCommentMappper.mapper(apiCompany))
        .toList();

    return commets;
  }

  Future<void> postComment(
      int postId, String name, String email, String body) async {
    await _apiCommentGet.postComment(postId, name, email, body);
  }
}
