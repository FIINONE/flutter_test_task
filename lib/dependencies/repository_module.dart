import 'package:flutter_test_task/data/repository/data_repository.dart';
import 'package:flutter_test_task/dependencies/api_module.dart';
import 'package:flutter_test_task/domain/repository/repository.dart';

class RepositoryModule {
  static UserRepository? _userRepository;
  static PostRepository? _postRepository;
  static AlbumRepository? _albumRepository;
  static PhotoRepository? _photoRepository;
  static CommentRepository? _commentRepository;

  static UserRepository? userRepository() {
    _userRepository ??= UserDataRepository(
      ApiModule.apiUserUtil(),
    );
    return _userRepository;
  }

  static PostRepository? postRepository() {
    _postRepository ??= PostDataRepository(
      ApiModule.apiPostUtil(),
    );
    return _postRepository;
  }

  static AlbumRepository? albumRepository() {
    _albumRepository ??= AlbumDataRepository(
      ApiModule.apiAlbumUtil(),
    );
    return _albumRepository;
  }

  static PhotoRepository? photoRepository() {
    _photoRepository ??= PhotoDataRepository(
      ApiModule.apiPhotoUtil(),
    );
    return _photoRepository;
  }

  static CommentRepository? commentRepository() {
    _commentRepository ??= CommentDataRepository(
      ApiModule.apiCommentUtil(),
    );
    return _commentRepository;
  }
}
