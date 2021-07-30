import 'package:flutter_test_task/domain/model/comment.dart';
import 'package:flutter_test_task/domain/repository/repository.dart';

class CommentProvider {
  CommentRepository? _commentRepository;

  CommentProvider(this._commentRepository);

  Future<List<Comment>> getComments(int postIndex) async {
    final comments = _commentRepository!.getCommets(postIndex);
    return comments;
  }
}
