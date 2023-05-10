import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  final Function(int) onTap;
  final int tabIndex;

  const BottomMenu({Key? key, required this.tabIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, key: ValueKey('BottomNavigationBarHome'),),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ad_units_outlined, key: ValueKey('BottomNavigationBarPosts'),),
          label: 'posts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined, key: ValueKey('BottomNavigationBarUsers')),
          label: 'users',
        ),
      ],
      currentIndex: tabIndex,
      onTap: onTap,
    );
  }
}
