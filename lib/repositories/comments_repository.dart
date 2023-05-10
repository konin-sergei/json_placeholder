import 'dart:core';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import 'package:json_placeholder/models/comment.dart';
import 'package:json_placeholder/constants.dart';

class ServerErrorComments {
  final String message;

  ServerErrorComments(this.message);
}

class CommentsRepository {
  Future<Either<ServerErrorComments, List<Comment>>> fetchComments(int postId) async {
    final dio = Dio(BaseOptions(baseUrl: backendServer));
    try {
      var response = await dio.get('/posts/$postId/comments');
      List<Comment> listComments = List<Comment>.from(response.data.map((x) => Comment.fromJson(x)));
      return Right(listComments);
    } catch (e) {
      return Left(ServerErrorComments(e.toString()));
    }
  }
}
