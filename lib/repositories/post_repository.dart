import 'dart:core';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:json_placeholder/models/comment.dart';

import 'package:json_placeholder/models/post.dart';
import 'package:json_placeholder/constants.dart';

class ServerErrorPost {
  final String message;

  ServerErrorPost(this.message);
}

class PostRepository {
  Future<Either<ServerErrorPost, Post>> fetchPost(postId) async {
    try {
      final dio = Dio(BaseOptions(baseUrl: backendServer));
      // get data post
      var responsePost = await dio.get('/posts/$postId');
      // get data comments
      var responseComments = await dio.get('/posts/$postId/comments');

      Post post = Post.fromJson(responsePost.data);
      List<Comment> comments = List<Comment>.from(responseComments.data.map((x) => Comment.fromJson(x)));
      post.comments = comments;

      return Right(post);
    } catch (e) {
      return Left(ServerErrorPost(e.toString()));
    }
  }
}
