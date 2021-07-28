import 'package:flutter/material.dart';
import 'package:flutter_test_task/domain/model/user.dart';
import 'package:flutter_test_task/ui/widgets/user_post.dart';
// import 'package:flutter_test_task/domain/model/user.dart';

class UserProfileScreen extends StatelessWidget {
  static String userProfile = '/users/user';

  final User user;
  const UserProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blue[100],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                ListTile(title: Text(user.name)),
                ListTile(title: Text(user.email)),
                ListTile(title: Text(user.phone)),
                ListTile(title: Text(user.website)),
                const SizedBox(height: 20),
                const Text('Company:'),
                Text(user.company.name),
                Text(user.company.bs),
                Text(
                  user.company.catchPhrase,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 20),
                const Text('Address:'),
                Text(
                    '${user.address.suite}, ${user.address.street}, ${user.address.city}, ${user.address.zipcode}'),
                UserListPostsPreview(
                  userId: user.id,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
