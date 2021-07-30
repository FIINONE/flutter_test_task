import 'dart:convert';
import 'dart:developer';
import 'package:flutter_test_task/data/api/data_cache/user_cache.dart';
import 'package:flutter_test_task/data/api/models/users/user.dart';
import 'package:flutter_test_task/data/api/services/constants.dart';
import 'package:http/http.dart' as http;

class ApiUserGet {
  final Uri url = Uri.https(Constants.authority, Constants.usersPath);
  static const String key = 'user_list';

  Future<List<ApiUser>?> getApiUsers() async {
    try {
      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final String body = response.body;
        await ApiUserCacheGet().setUserCache(key, body);

        final List jsonList = json.decode(response.body) as List<dynamic>;
        final users = jsonList
            .map(
              (dynamic user) => ApiUser.fromJson(user as Map<String, dynamic>),
            )
            .toList();
        log('$users');

        return users;
      }
    } catch (e) {
      return null;
    }
  }
}
