import 'package:flutter/material.dart';
import 'package:flutter_test_task/domain/model/photo.dart';
import 'package:flutter_test_task/domain/provider/photo_povider.dart';
import 'package:provider/provider.dart';

class AlbumPhotoPreview extends StatelessWidget {
  final int albumId;

  const AlbumPhotoPreview({
    Key? key,
    required this.albumId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photoModel =
        context.read<PhotoProvider>().getPhotos(albumId);
    return FutureBuilder<List<Photo>>(
      future: photoModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 100,
            width: 100,
            child: Image.network(snapshot.data![0].thumbnailUrl),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
