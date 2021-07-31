import 'dart:convert';
import 'dart:developer';

import 'package:flutter_test_task/data/api/data_cache/comment_cache.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_test_task/data/api/models/comments/comment.dart';
import 'package:flutter_test_task/data/api/services/constants.dart';

class ApiCommentGet {
  Future<List<ApiComment>?> getCommits(int postId) async {
    final String key = 'comment_postId$postId';
    final Map<String, String> queryParam = {'postId': postId.toString()};

    final Uri uri =
        Uri.https(Constants.authority, Constants.commentsPath, queryParam);

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final String body = response.body;
       await ApiCommentCacheGet().setCommentCache(key, body);

        final List<dynamic> commentsList = json.decode(body) as List<dynamic>;

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

  Future<void> postComment(
      int postId, String name, String email, String body) async {
    final String key = 'fake_comment_postId$postId';
    final Map<String, String> queryParam = {'postId': postId.toString()};

    final Map<String, dynamic> bodyMap = <String, dynamic>{
      'postId': postId,
      'name': name.toString(),
      'email': email.toString(),
      'body': body.toString(),
    };
    final String bodyString = json.encode(bodyMap);

    final Uri uri =
        Uri.https(Constants.authority, Constants.commentsPath, queryParam);

    try {
      final response = await http.post(
        uri,
        body: bodyString,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 201) {
        final String responseBody = response.body;
        final bool result =
            await ApiCommentCacheGet().setCommentCache(key, responseBody);

        log('Post created: $result');
      } else {
        throw Exception('Failed to create post.');
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
