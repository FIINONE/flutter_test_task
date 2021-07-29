import 'package:flutter_test_task/dependencies/repository_module.dart';
import 'package:flutter_test_task/domain/provider/album_provider.dart';
import 'package:flutter_test_task/domain/provider/photo_povider.dart';
import 'package:flutter_test_task/domain/provider/post_provider.dart';
import 'package:flutter_test_task/domain/provider/user_provider.dart';

class ProviderModule {
  static UserProvider userProvider() {
    return UserProvider(
      RepositoryModule.userRepository(),
    );
  }

  static PostProvider postProvider() {
    return PostProvider(
      RepositoryModule.postRepository(),
    );
  }

  static AlbumProvider albumProvider() {
    return AlbumProvider(
      RepositoryModule.albumRepository(),
    );
  }

  static PhotoProvider photoProvider() {
    return PhotoProvider(
      RepositoryModule.photoRepository(),
    );
  }
}
