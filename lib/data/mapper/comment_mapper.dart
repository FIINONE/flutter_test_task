import 'package:flutter_test_task/data/api/models/comments/comment.dart';
import 'package:flutter_test_task/domain/model/comment.dart';

class ApiCommentMappper {
  static Comment mapper(ApiComment apiComment) {
    return Comment(
      body: apiComment.body!,
      email: apiComment.email!,
      id: apiComment.id!,
      name: apiComment.name!,
      postId: apiComment.postId!,
    );
  }
}
