import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_test_task/domain/model/photo.dart';
import 'package:flutter_test_task/domain/provider/photo_povider.dart';

class PhotosScreen extends StatelessWidget {
  static const String photos = '/users/user/photos';

  final int albumId;

  const PhotosScreen({
    Key? key,
    required this.albumId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photosModel = context.read<PhotoProvider>().getPhotos(albumId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User`s Photos'),
      ),
      body: FutureBuilder<List<Photo>>(
        future: photosModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                );
              },
              separatorBuilder: (context, int index) {
                return const Divider();
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
