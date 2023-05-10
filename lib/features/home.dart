import 'package:flutter/material.dart';
import 'package:json_placeholder/features/home/home_page.dart';
import 'package:json_placeholder/features/posts/posts_page.dart';
import 'package:json_placeholder/features/users/users_page.dart';
import 'package:json_placeholder/widgets/bottom_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.selectedIndex}) : super(key: key);
  final int selectedIndex;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex ?? 0;
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    PostsPage(),
    UsersPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomMenu(tabIndex: _selectedIndex, onTap: _onItemTapped),
    );
  }
}
