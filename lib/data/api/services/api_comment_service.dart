import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:flutter_test_task/data/api/models/comments/comment.dart';
import 'package:flutter_test_task/data/api/services/constants.dart';

class ApiCommentGet {
  Future<List<ApiComment>?> getCommits(Map<String, String> postId) async {
    final Map<String, String> queryParam = postId;

    final Uri uri =
        Uri.https(Constants.authority, Constants.commentsPath, queryParam);

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> commentsList =
            json.decode(response.body) as List<dynamic>;

        final apiComments = commentsList
            .map((dynamic comment) =>
                ApiComment.fromJson(comment as Map<String, dynamic>))
            .toList();

        log('$apiComments');
        return apiComments;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
