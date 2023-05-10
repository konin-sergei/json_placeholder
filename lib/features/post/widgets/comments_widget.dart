import 'package:flutter/material.dart';
import 'package:json_placeholder/models/comment.dart';

class CommentsWidget extends StatelessWidget {
  final List<Comment>? comments;

  const CommentsWidget({Key? key, this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (comments is List && comments!.isNotEmpty) {
      return Expanded(
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 8),
          itemCount: comments!.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(comments![index].body);
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      );
    } else {
      return const Text(
        "No comments",
        textAlign: TextAlign.center,
      );
    }
  }
}
