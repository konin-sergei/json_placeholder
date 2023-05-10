import 'package:flutter/material.dart';
import 'package:json_placeholder/models/post.dart';
import 'package:json_placeholder/features/post/widgets/comments_widget.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "title",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          post.title,
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "body",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          post.body,
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Comments",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        CommentsWidget(comments: post.comments),
      ],
    );
  }
}
