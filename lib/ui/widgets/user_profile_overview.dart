import 'package:flutter/material.dart';
import 'package:flutter_test_task/domain/model/user.dart';
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
          '${user.address.suite}, ${user.address.street}, ${user.address.city}, ${user.address.zipcode}',
        ),
        SizedBox(
          height: 150,
          child: UserPostsPreview(userId: user.id),
        ),
        SizedBox(
          height: 150,
          width: 500,
          child: UserAlbumsPreview(userId: user.id),
        ),
      ],
    );
  }
}
