import 'dart:io';

import 'package:ecassion/ui/notifications/notifications_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../home/bloc/home_page.dart';
import '../profile/profile_page.dart';
import '../search/search_page.dart';

const homeScreenTabs = [
  HomePage(),
  SearchPage(),
  NotificationsPage(),
  ProfilePage(),
];

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        } else {
          exit(0);
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f9),
        extendBody: true,
        body: homeScreenTabs[_selectedIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            elevation: 1,
            type: BottomNavigationBarType.fixed,
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            currentIndex: _selectedIndex,
            onTap: (index) {
              _onItemTapped(index);
            },
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            selectedItemColor: const Color(0xff6564DB),
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.bubble_left,
                ),
                activeIcon: Icon(
                  CupertinoIcons.bubble_left,
                  color: Color(0xff6564DB),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.search,
                ),
                activeIcon: Icon(
                  CupertinoIcons.search,
                  color: Color(0xff6564DB),
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.bell,
                ),
                activeIcon: Icon(
                  CupertinoIcons.bell,
                  color: Color(0xff6564DB),
                ),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                activeIcon: Icon(
                  CupertinoIcons.person,
                  color: Color(0xff6564DB),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
