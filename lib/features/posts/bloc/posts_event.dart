abstract class PostsBaseEvent {}

class PostsGetPostsEvent extends PostsBaseEvent {
  PostsGetPostsEvent();
}

class PostsFailureLoadEvent extends PostsBaseEvent {
  PostsFailureLoadEvent();
}
