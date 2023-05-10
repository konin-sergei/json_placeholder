import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder/models/post.dart';
import 'package:json_placeholder/repositories/posts_repository.dart';

import 'posts_event.dart';
import 'posts_state.dart';

class PostsBloc extends Bloc<PostsBaseEvent, PostsBaseState> {
  PostsBloc() : super(PostsInitState()) {
    on<PostsGetPostsEvent>((event, emit) async {
      emit(PostsInProgressState());
      emit(await postsGet());
    });
  }

  Future<PostsBaseState> postsGet() async {
    PostsRepository postsRepository = PostsRepository();
    Either<ServerError, List<Post>> result = await postsRepository.fetchPosts();

    if (result.isRight) {
      List<Post> posts = result.right;
      return PostsGotState(posts: posts);
    } else {
      ServerError serverError = result.left;
      String message = serverError.message;
      return PostsFailureState(message);
    }
  }
}
