import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/posts_bloc.dart';
import 'bloc/posts_event.dart';
import 'bloc/posts_state.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: const PostsPageBody(),
      //bottomNavigationBar: Menu(),
    );
  }
}

class PostsPageBody extends StatelessWidget {
  const PostsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostsBloc()..add(PostsGetPostsEvent()),
      child: BlocBuilder<PostsBloc, PostsBaseState>(
        builder: (context, state) {
          if (state is PostsInProgressState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostsFailureState) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is PostsGotState) {
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: state.posts.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    context.goNamed(
                      'post',
                      pathParameters: <String, String>{'postId': state.posts[index].id.toString()},
                    );
                  },
                  child: Container(
                    height: 50,
                    color: Colors.white10,
                    child: Center(
                      child: Text(
                        'Entry ${state.posts[index].title}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
