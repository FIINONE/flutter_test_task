import 'package:flutter_test_task/data/api/models/posts/post.dart';
import 'package:flutter_test_task/domain/model/post.dart';

class PostMapper {
  static Post mapper(ApiPost apiPost) {
    return Post(
      body: apiPost.body!,
      id: apiPost.id!,
      title: apiPost.title!,
      userId: apiPost.userId!,
    );
  }
}
