import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:json_placeholder/features/home.dart';
import 'package:json_placeholder/features/post/post_page.dart';
import 'package:json_placeholder/features/posts/posts_page.dart';
import 'package:json_placeholder/features/users/users_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen(selectedIndex: 0);
      },
    ),
    GoRoute(
      path: '/bottom_navigation_bar/:selectedIndex',
      name: 'bottom_navigation_bar',
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen(selectedIndex: int.parse(state.pathParameters['selectedIndex'] ?? '0'));
      },
    ),
    GoRoute(
        path: '/posts',
        name: 'posts',
        builder: (BuildContext context, GoRouterState state) {
          return const PostsPage();
        },
        routes: [
          GoRoute(
            name: 'post',
            path: 'post/:postId',
            builder: (BuildContext context, GoRouterState state) {
              return PostPage(postId: int.parse(state.pathParameters['postId'] ?? '0'));
            },
          ),
        ]),
    GoRoute(
      path: '/users',
      builder: (BuildContext context, GoRouterState state) {
        return const UsersPage();
      },
    ),
  ],
);