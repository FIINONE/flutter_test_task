import 'dart:convert';

import 'package:flutter_test_task/data/api/models/users/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiUserCacheGet {
  final _shared = SharedPreferences.getInstance();
  static const String key = 'user_list';

  Future<void> setUserCache(String key, String body) async {
    final shared = await _shared;
    await shared.setString(key, body);
  }

  Future<List<ApiUser>?> getUserCache() async {
    final shared = await _shared;
    final String? body = shared.getString(key);
    if (body != null) {
      final List userlist = json.decode(body) as List<dynamic>;
      final apiUsers = userlist
          .map((dynamic json) => ApiUser.fromJson(json as Map<String, dynamic>))
          .toList();
      return apiUsers;
    }
  }

  Future<bool> containsKey() async {
    final SharedPreferences shared = await _shared;
    return shared.containsKey(key);
  }
}
