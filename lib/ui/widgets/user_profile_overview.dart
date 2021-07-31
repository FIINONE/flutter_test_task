import 'package:flutter/material.dart';
import 'package:flutter_test_task/domain/model/user.dart';
import 'package:flutter_test_task/ui/screens/user_posts.dart';
import 'package:flutter_test_task/ui/widgets/user_albums_preview.dart';
import 'package:flutter_test_task/ui/widgets/user_post_preview.dart';

class UserProfileOverview extends StatelessWidget {
  final User user;

  const UserProfileOverview({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(),
        ListTile(
          title: Text(user.name),
          leading: const Icon(Icons.person),
        ),
        ListTile(
          title: Text(user.email),
          leading: const Icon(Icons.email),
        ),
        ListTile(
          title: Text(user.phone),
          leading: const Icon(Icons.phone),
        ),
        ListTile(
          title: Text(user.website),
          leading: const Icon(Icons.language),
        ),
        const SizedBox(height: 20),
        const Text(
          'Company:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text('Name: ${user.company.name}',
            style: const TextStyle(
              fontSize: 16,
            )),
        Text('BS: ${user.company.bs}',
            style: const TextStyle(
              fontSize: 16,
            )),
        Text(
          'Catch-pharase: ${user.company.catchPhrase}',
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Address:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          '${user.address.suite}, ${user.address.street}, ${user.address.city}, ${user.address.zipcode}',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        UserPostsPreview(userId: user.id),
        const SizedBox(height: 20),
        UserAlbumsPreview(userId: user.id),
      ],
    );
  }
}
