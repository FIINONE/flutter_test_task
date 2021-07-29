import 'package:flutter_test_task/domain/model/album.dart';
import 'package:flutter_test_task/domain/model/comment.dart';
import 'package:flutter_test_task/domain/model/photo.dart';
import 'package:flutter_test_task/domain/model/post.dart';
import 'package:flutter_test_task/domain/model/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}

abstract class PostRepository {
  Future<List<Post>> getPosts(Map<String, String> userId);
}

abstract class AlbumRepository {
  Future<List<Album>> getAlbums(Map<String, String> userId);
}

abstract class PhotoRepository {
  Future<List<Photo>> getPhotos(Map<String, String> albumId);
}

abstract class CommentRepository {
  Future<List<Comment>> getCommets(Map<String, String> postId);
}
