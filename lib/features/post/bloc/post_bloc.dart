import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder/models/post.dart';
import 'package:json_placeholder/repositories/post_repository.dart';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostBaseEvent, PostBaseState> {
  PostBloc() : super(PostInitState()) {
    on<PostGetPostEvent>(
      (event, emit) async {
        emit(PostInProgressState());
        emit(await postGet(event.postId));
      },
    );
  }

  Future<PostBaseState> postGet(postId) async {
    PostRepository postRepository = PostRepository();
    Either<ServerErrorPost, Post> resultPost = await postRepository.fetchPost(postId);

    if (resultPost.isRight) {
      Post post = resultPost.right;
      return PostGotState(post: post);
    } else {
      ServerErrorPost serverError = resultPost.left;
      String message = serverError.message;
      return PostFailureState(message);
    }
  }
}
