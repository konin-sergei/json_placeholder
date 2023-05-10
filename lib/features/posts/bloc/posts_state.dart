import 'package:json_placeholder/models/post.dart';

abstract class PostsBaseState {}

class PostsInitState extends PostsBaseState {
  PostsInitState();
}

class PostsInProgressState extends PostsBaseState {
  PostsInProgressState();
}

class PostsGotState extends PostsBaseState {
  List<Post> posts;

  PostsGotState({required this.posts});
}

class PostsFailureState extends PostsBaseState {
  String error;

  PostsFailureState(this.error);
}
