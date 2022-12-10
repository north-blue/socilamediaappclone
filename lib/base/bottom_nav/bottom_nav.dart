

import 'package:flutter/material.dart';
import 'package:socilamedia_one_flutter/constant/constant.dart';
import 'package:socilamedia_one_flutter/pages/home/home_screen.dart';
import 'package:socilamedia_one_flutter/pages/profile/profileui.dart';
import 'package:socilamedia_one_flutter/pages/search/search.dart';






class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;

  List pages = [const HomePage(), const SearchPage(), ProfileUi()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pages[_selectedIndex]
          //_widgetOptions.elementAt(_selectedIndex),  //when page is selectet
          ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: ifelseTextColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: ifelseTextColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: ifelseTextColor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: titleTextColor,
        onTap: _onItemTapped,
      ),
    );
  }
}




