import 'package:json_placeholder/models/user.dart';

abstract class UsersBaseState {}

class UsersInitState extends UsersBaseState {}

class UsersInProgressState extends UsersBaseState {}

class UsersGotState extends UsersBaseState {
  List<User> users;

  UsersGotState({required this.users});
}

class UsersFailureState extends UsersBaseState {
  String error;

  UsersFailureState(this.error);
}
