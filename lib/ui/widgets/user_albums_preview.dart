import 'package:flutter/material.dart';
import 'package:flutter_test_task/ui/widgets/user_album_photo_preview.dart';
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
                    AlbumPhotoPreview(albumId: snapshot.data![index].id),
                    Expanded(child: Text(snapshot.data![index].title))
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
