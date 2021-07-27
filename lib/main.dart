import 'package:flutter/material.dart';
import 'package:flutter_test_task/ui/screens/user_list.dart';
import 'package:flutter_test_task/ui/screens/user_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const UserListScreen(),
      routes: {
        UserListScreen.userlist: (context) => const UserListScreen(),
        UserProfileScreen.userProfile: (context) => const UserProfileScreen(),
      },
    );
  }
}
