import 'dart:core';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import 'package:json_placeholder/constants.dart';
import 'package:json_placeholder/models/user.dart';

class ServerErrorUsers {
  final String message;

  ServerErrorUsers(this.message);
}

class UsersRepository {
  Future<Either<ServerErrorUsers, List<User>>> fetchUsers() async {
    try {
      final dio = Dio(BaseOptions(baseUrl: backendServer));
      var response = await dio.get('/users');
      List<User> users = List<User>.from(response.data.map((x) => User.fromJson(x)));
      return Right(users);
    } catch (e) {
      return Left(ServerErrorUsers(e.toString()));
    }
  }
}
