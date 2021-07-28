import 'package:flutter/material.dart';
import 'package:flutter_test_task/domain/model/user.dart';
import 'package:flutter_test_task/domain/provider/user_provider.dart';
// import 'package:flutter_test_task/data/services/typecode_service.dart';
// import 'package:flutter_test_task/domain/model/user.dart';
import 'package:flutter_test_task/ui/screens/user_profile.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatelessWidget {
  static String userlist = '/users';

  const UserListScreen({Key? key}) : super(key: key);

  // void _showUser(BuildContext context, User user) {
  //   Navigator.of(context)
  //       .pushNamed(UserProfileScreen.userProfile, arguments: user);
  // }

  @override
  Widget build(BuildContext context) {
    final _modelUsers =
        Provider.of<UserProvider>(context, listen: false).getUser();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: FutureBuilder<List<User>>(
        future: _modelUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  title: Text(
                    'Username: ${snapshot.data![index].username}',
                  ),
                  subtitle: Text('Name: ${snapshot.data![index].name}'),
                  onTap: () => context
                      .read<UserProvider>()
                      .showUser(context, snapshot.data![index]),
                );
              },
              separatorBuilder: (_, __) => const Divider(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
