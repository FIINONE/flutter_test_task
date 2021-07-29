import 'package:flutter/material.dart';
import 'package:flutter_test_task/domain/model/photo.dart';
import 'package:flutter_test_task/domain/provider/photo_povider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_test_task/domain/model/album.dart';
import 'package:flutter_test_task/domain/provider/album_provider.dart';

class UserAlbumsPreview extends StatelessWidget {
  final int userId;

  const UserAlbumsPreview({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final albumModel = context.read<AlbumProvider>().getAlbums(userId);
    return FutureBuilder<List<Album>>(
      future: albumModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: 3,
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    AlbumPhotoPreview(
                      albumId: snapshot.data![index].id,
                    ),
                    Text(snapshot.data![index].title)
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class AlbumPhotoPreview extends StatelessWidget {
  final int albumId;

  const AlbumPhotoPreview({
    Key? key,
    required this.albumId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photoModel =
        context.read<PhotoProvider>().getAlbumPhotoPreview(albumId);
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
