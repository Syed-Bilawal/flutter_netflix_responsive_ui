import 'dart:html';

import 'package:flutter/material.dart';
import 'package:netflix/screen/home_screens.dart';
import 'package:netflix/widgets/widgets.dart';

class nav_screen extends StatefulWidget {
  const nav_screen({super.key});

  @override
  State<nav_screen> createState() => _nav_screenState();
}

class _nav_screenState extends State<nav_screen> {
  final List<Widget> _screens = [
    HomeScreen(key: PageStorageKey('homeScreen'),),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map< String , IconData> _icons = {
    'Home' : Icons.home,
    'Search' : Icons.search,
    'Coming Soon' : Icons.queue_play_next,
    'Downloads' : Icons.file_download,
    'More' : Icons.menu
  };
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: !Responsive.isDesktop(context)?
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: _icons.map((title, icon) => MapEntry(
        title, BottomNavigationBarItem(icon: Icon(icon , size: 30,),
        label: title
        )
      )).values.toList(),
      currentIndex: _currentIndex,
      selectedItemColor:  Colors.white,
      selectedFontSize: 11,
      unselectedItemColor: Colors.grey,
      unselectedFontSize: 11,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      ): null,
    );
  }
}