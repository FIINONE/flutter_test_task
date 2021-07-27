import 'package:flutter/material.dart';
import 'package:flutter_test_task/data/services/typecode_service.dart';
import 'package:flutter_test_task/domain/model/user.dart';
import 'package:flutter_test_task/ui/screens/user_profile.dart';

class UserListScreen extends StatefulWidget {
  static String userlist = '/users';

  const UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late final Future<List<User>?> users;

  @override
  void initState() {
    super.initState();

    users = ApiTypecode().getUsers();
  }

  void _showUser(BuildContext context) {
    Navigator.of(context).pushNamed(UserProfileScreen.userProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: FutureBuilder<List<User>?>(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, int index) {
                return Card(
                  child: ListTile(
                    leading: Text(
                      snapshot.data![index].name,
                    ),
                    subtitle: Text(snapshot.data![index].username),
                    onTap: () => _showUser,
                  ),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
