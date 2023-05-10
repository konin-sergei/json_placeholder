import 'package:json_placeholder/models/post.dart';

abstract class PostBaseState {}

class PostInitState extends PostBaseState {
  PostInitState();
}

class PostGotState extends PostBaseState {
  Post post;

  PostGotState({required this.post});
}

class PostInProgressState extends PostBaseState {
  PostInProgressState();
}

class PostFailureState extends PostBaseState {
  String error;

  PostFailureState(this.error);
}

