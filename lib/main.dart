import 'package:flutter/material.dart';
import 'package:json_placeholder/router/router.dart';
import 'package:json_placeholder/themes/theme.dart';

void main() {
  return runApp(const JsonPlaceholderApp());
}

class JsonPlaceholderApp extends StatelessWidget {
  const JsonPlaceholderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
