import 'package:flutter/cupertino.dart';
import 'package:flutter_test_task/domain/model/comment.dart';
import 'package:flutter_test_task/domain/repository/repository.dart';

class CommentProvider extends ChangeNotifier {
  CommentRepository? _commentRepository;

  CommentProvider(this._commentRepository) {
    // getComments(index);
  }

  Future<List<Comment>> getComments(int postIndex) async {
    final comments = await _commentRepository!.getCommets(postIndex);
    notifyListeners();
    return comments;
  }

  Future<void> postComment(
      int postIndex, String name, String email, String body) async {
    await _commentRepository!.postComment(postIndex, name, email, body);
  }
}
