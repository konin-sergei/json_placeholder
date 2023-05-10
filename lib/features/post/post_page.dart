import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:json_placeholder/features/post/widgets/post_widget.dart';

import 'bloc/post_bloc.dart';
import 'bloc/post_event.dart';
import 'bloc/post_state.dart';

class PostPage extends StatelessWidget {
  final int postId;

  const PostPage({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.goNamed(
          'bottom_navigation_bar',
          pathParameters: <String, String>{"selectedIndex": "1"},
        );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Post"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: BlocProvider(
            create: (_) => PostBloc()..add(PostGetPostEvent(postId)),
            child: BlocBuilder<PostBloc, PostBaseState>(
              builder: (context, state) {
                if (state is PostInProgressState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is PostFailureState) {
                  return Center(
                    child: Text(state.error),
                  );
                }

                if (state is PostInitState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is PostGotState) {
                  return PostWidget(post: state.post);
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
