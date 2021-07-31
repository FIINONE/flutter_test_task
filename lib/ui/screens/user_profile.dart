import 'package:flutter/material.dart';

import 'package:flutter_test_task/domain/model/user.dart';
import 'package:flutter_test_task/ui/screens/user_albums.dart';
import 'package:flutter_test_task/ui/screens/user_posts.dart';
import 'package:flutter_test_task/ui/widgets/user_profile_overview.dart';

class UserProfileScreen extends StatefulWidget {
  static String userProfile = '/users/user';

  final User user;
  const UserProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  int currentIndex = 0;

  late final List<Widget> userPreviewInfo;

  @override
  void initState() {
    super.initState();
    userPreviewInfo = <Widget>[
      UserProfileOverview(user: widget.user),
      UserPostsScreen(userIndex: widget.user.id),
      UserAlbumsScreen(userIndex: widget.user.id),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.user.username),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails detail) {
          setState(() {
            if (detail.primaryVelocity! < 0) {
              currentIndex += 1;
              if (currentIndex > 2) {
                currentIndex = 2;
              }
            }
            if (detail.primaryVelocity! > 0) {
              currentIndex -= 1;
              if (currentIndex < 0) {
                currentIndex = 0;
              }
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.blue[50],
            ),
            child: userPreviewInfo[currentIndex],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'User Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'User album',
          ),
        ],
      ),
    );
  }
}
