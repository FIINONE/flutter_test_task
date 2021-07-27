// import 'package:flutter_test_task/domain/model/user.dart';

part of '../../domain/model/user.dart';

abstract class UserJson {
  static User fromJson(Map<String, dynamic> json) {
    return User(
      // id: json['id'],
      name: json['name'] as String,
      username: json['username'] as String,
    );
  }
}
