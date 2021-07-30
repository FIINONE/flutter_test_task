import 'package:flutter_test_task/data/api/data_cache/album_cache.dart';
import 'package:flutter_test_task/data/api/data_cache/comment_cache.dart';
import 'package:flutter_test_task/data/api/data_cache/photo_cache.dart';
import 'package:flutter_test_task/data/api/data_cache/post_cache.dart';
import 'package:flutter_test_task/data/api/data_cache/user_cache.dart';
import 'package:flutter_test_task/data/api/services/api_album_service.dart';
import 'package:flutter_test_task/data/api/services/api_comment_service.dart';
import 'package:flutter_test_task/data/api/services/api_photo_service.dart';
import 'package:flutter_test_task/data/api/services/api_post_service.dart';
import 'package:flutter_test_task/data/api/api_util.dart';
import 'package:flutter_test_task/data/api/services/api_user_service.dart';

class ApiModule {
  static ApiUserUtil? _apiUserUtil;
  static ApiPostUtil? _apiPostUtil;
  static ApiAlbumUtil? _apiAlbumUtil;
  static ApiPhotoUtil? _apiPhotoUtil;
  static ApiCommentUtil? _apiCommentUtil;

  static ApiUserUtil? apiUserUtil() {
    _apiUserUtil ??= ApiUserUtil(ApiUserGet(), ApiUserCacheGet());
    return _apiUserUtil;
  }

  static ApiPostUtil? apiPostUtil() {
    _apiPostUtil ??= ApiPostUtil(ApiPostGet(), ApiPostCacheGet());
    return _apiPostUtil;
  }

  static ApiAlbumUtil? apiAlbumUtil() {
    _apiAlbumUtil ??= ApiAlbumUtil(ApiAlbumGet(), ApiAlbumCacheGet());
    return _apiAlbumUtil;
  }

  static ApiPhotoUtil? apiPhotoUtil() {
    _apiPhotoUtil ??= ApiPhotoUtil(ApiPhotoGet(), ApiPhotoCacheGet());
    return _apiPhotoUtil;
  }

  static ApiCommentUtil? apiCommentUtil() {
    _apiCommentUtil ??= ApiCommentUtil(ApiCommentGet(), ApiCommentCacheGet());
    return _apiCommentUtil;
  }
}
