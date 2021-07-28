import 'dart:convert';
import 'dart:developer';
// import 'dart:developer';

import 'package:flutter_test_task/data/api/models/users/user.dart';
import 'package:http/http.dart' as http;

class ApiUserGet {
  final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  Future<List<ApiUser>?> getApiUsers() async {
    try {
      final http.Response response;
      response = await http.get(url);

      if (response.statusCode == 200) {
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
