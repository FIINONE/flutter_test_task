import 'package:flutter/material.dart';
import 'package:flutter_test_task/domain/model/user.dart';
import 'package:flutter_test_task/domain/repository/repository.dart';
import 'package:flutter_test_task/ui/screens/user_profile.dart';
// import 'package:flutter_test_task/domain/repository/user_repository.dart';

class UserProvider {
  UserRepository? _userRepository;

  int? index;

  UserProvider(
    this._userRepository,
  );

  Future<List<User>> getUser() async {
    final users = await _userRepository!.getUsers();
    return users;
  }

  void showUser(BuildContext context, User user) {
    Navigator.of(context)
        .pushNamed(UserProfileScreen.userProfile, arguments: user);
  }

  void currientIndex(int index) {
    this.index = index;
  }
}
