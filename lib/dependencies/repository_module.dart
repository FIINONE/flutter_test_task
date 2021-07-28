import 'package:flutter_test_task/data/repository/data_repository.dart';
import 'package:flutter_test_task/dependencies/api_module.dart';
import 'package:flutter_test_task/domain/repository/repository.dart';

class RepositoryModule {
  static UserRepository? _userRepository;
  static PostRepository? _postRepository;

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
}
