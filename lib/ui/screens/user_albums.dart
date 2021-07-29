import 'package:flutter/material.dart';
import 'package:flutter_test_task/domain/model/album.dart';
import 'package:flutter_test_task/domain/provider/album_provider.dart';
import 'package:flutter_test_task/ui/widgets/user_album_photo_preview.dart';
import 'package:provider/provider.dart';

class UserAlbumsScreen extends StatelessWidget {
  final int userIndex;

  const UserAlbumsScreen({
    Key? key,
    required this.userIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final albumModel = context.read<AlbumProvider>().getAlbums(userIndex);
    return FutureBuilder<List<Album>>(
      future: albumModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, int index) {
              return Row(
                children: [
                  AlbumPhotoPreview(albumId: snapshot.data![index].id),
                  Expanded(child: Text(snapshot.data![index].title)),
                ],
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
    );
  }
}
