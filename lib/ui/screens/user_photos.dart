import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_test_task/domain/model/photo.dart';
import 'package:flutter_test_task/domain/provider/photo_povider.dart';

class PhotosScreen extends StatelessWidget {
  static const String photos = '/users/user/photos';

  final int albumId;

  PhotosScreen({
    Key? key,
    required this.albumId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _pageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    final Future<List<Photo>> photosModel =
        context.read<PhotoProvider>().getPhotos(albumId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User`s Photos'),
      ),
      body: FutureBuilder<List<Photo>>(
        future: photosModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
              controller: _pageController,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, int index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, widget) {
                    double value = 1;
                    if (_pageController.position.haveDimensions) {
                      value = _pageController.page! - index;
                      value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                    }
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: 400 * Curves.easeInOut.transform(value),
                            width: 400 * Curves.easeInOut.transform(value),
                            child: widget),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Expanded(
                        child: Image.network(
                          snapshot.data![index].url,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        snapshot.data![index].title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                );
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
