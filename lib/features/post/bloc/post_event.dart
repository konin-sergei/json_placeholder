abstract class PostBaseEvent {}

class PostGetPostEvent extends PostBaseEvent {
  int postId;

  PostGetPostEvent(this.postId);
}

class PostFailureLoadEvent extends PostBaseEvent {
  PostFailureLoadEvent();
}
