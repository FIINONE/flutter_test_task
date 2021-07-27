import 'dart:convert';
// import 'dart:developer';

import 'package:flutter_test_task/domain/model/user.dart';
import 'package:http/http.dart' as http;

class ApiTypecode {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  Future<List<User>?> getUsers() async {
    final response = await http.get(url);
    // log(response.body);
    try {
      if (response.statusCode == 200) {
        final jsonList = json.decode(response.body) as List<dynamic>;
        final users = jsonList
            .map(
              (dynamic user) => UserJson.fromJson(user as Map<String, dynamic>),
            )
            .toList();
        return users;
      }
    } catch (e) {
      return null;
    }
  }
}
