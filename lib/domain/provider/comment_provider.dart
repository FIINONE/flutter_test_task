import 'package:flutter_test_task/domain/model/comment.dart';
import 'package:flutter_test_task/domain/repository/repository.dart';

class CommentProvider {
  CommentRepository? _commentRepository;

  CommentProvider(this._commentRepository);

  Future<List<Comment>> getComments(int postIndex) async {
    final Map<String, String> postId = {'postId': postIndex.toString()};
    final comments = _commentRepository!.getCommets(postId);
    return comments;
  }
}
