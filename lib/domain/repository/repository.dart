import 'package:flutter_test_task/domain/model/album.dart';
import 'package:flutter_test_task/domain/model/comment.dart';
import 'package:flutter_test_task/domain/model/photo.dart';
import 'package:flutter_test_task/domain/model/post.dart';
import 'package:flutter_test_task/domain/model/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}

abstract class PostRepository {
  Future<List<Post>> getPosts(int userId);
}

abstract class AlbumRepository {
  Future<List<Album>> getAlbums(int userId);
}

abstract class PhotoRepository {
  Future<List<Photo>> getPhotos(int albumId);
}

abstract class CommentRepository {
  Future<List<Comment>> getCommets(int postId);
  Future<void> postComment(
      int postIndex, String name, String email, String body);
}
