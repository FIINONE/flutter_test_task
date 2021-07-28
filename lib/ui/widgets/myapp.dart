import 'package:flutter/material.dart';
import 'package:flutter_test_task/dependencies/provider_module.dart';
import 'package:flutter_test_task/domain/model/user.dart';
import 'package:flutter_test_task/domain/provider/post_provider.dart';
import 'package:flutter_test_task/domain/provider/user_provider.dart';
import 'package:flutter_test_task/ui/screens/user_list.dart';
import 'package:flutter_test_task/ui/screens/user_profile.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final PostProvider _postProvider;
  late final UserProvider users;

  @override
  void initState() {
    super.initState();

    users = ProviderModule.userProvider();
    _postProvider = ProviderModule.postProvider();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserProvider>.value(
          value: users,
        ),
        Provider<PostProvider>.value(value: _postProvider),
      ],
      child: MaterialApp(
        routes: {
          UserListScreen.userlist: (context) => const UserListScreen(),
          UserProfileScreen.userProfile: (context) {
            final User user =
                ModalRoute.of(context)?.settings.arguments as User;
            return UserProfileScreen(
              user: user,
            );
          },
        },
        initialRoute: UserListScreen.userlist,
      ),
    );
  }
}
