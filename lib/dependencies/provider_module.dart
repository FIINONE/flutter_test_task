import 'package:flutter_test_task/dependencies/repository_module.dart';
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
}
