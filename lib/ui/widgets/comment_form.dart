import 'package:flutter/material.dart';
import 'package:flutter_test_task/domain/provider/comment_provider.dart';
import 'package:provider/provider.dart';

class CommentSendForm extends StatefulWidget {
  final int postIndex;
  const CommentSendForm({Key? key, required this.postIndex}) : super(key: key);

  @override
  _CommentSendFormState createState() => _CommentSendFormState();
}

class _CommentSendFormState extends State<CommentSendForm> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerBody = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controllerName.clear();
    _controllerEmail.clear();
    _controllerBody.clear();
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerEmail.dispose();
    _controllerBody.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final commentModelRead = context.read<CommentProvider>();

    return FloatingActionButton(
      child: const Icon(Icons.add_comment),
      onPressed: () {
        showDialog<Widget>(
            context: context,
            builder: (_) {
              return SimpleDialog(
                title: const Text(
                  'Enter your comment',
                  textAlign: TextAlign.center,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                children: [
                  TextField(
                    controller: _controllerName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter name',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _controllerEmail,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter email',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _controllerBody,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter comment',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      if (_controllerName.text.isEmpty &
                          _controllerEmail.text.isEmpty &
                          _controllerBody.text.isEmpty) {}
                      commentModelRead.postComment(
                          widget.postIndex,
                          _controllerName.text,
                          _controllerEmail.text,
                          _controllerBody.text);

                      _controllerName.clear();
                      _controllerEmail.clear();
                      _controllerBody.clear();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Send',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              );
            });
      },
    );
  }
}
