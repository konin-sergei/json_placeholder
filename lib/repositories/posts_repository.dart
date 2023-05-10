import 'dart:core';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import 'package:json_placeholder/models/post.dart';
import 'package:json_placeholder/constants.dart';

class ServerError {
  final String message;

  ServerError(this.message);
}

class PostsRepository {
  Future<Either<ServerError, List<Post>>> fetchPosts() async {
    try {
      final dio = Dio(BaseOptions(baseUrl: backendServer));
      var response = await dio.get('/posts');
      List<Post> posts = List<Post>.from(response.data.map((x) => Post.fromJson(x)));
      return Right(posts);
    } catch (e) {
      return Left(ServerError(e.toString()));
    }
  }
}
