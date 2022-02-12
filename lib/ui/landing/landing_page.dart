import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bookmarks/bookmarks_page.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';
import '../search/search_page.dart';

const homeScreenTabs = [
  HomePage(),
  SearchPage(),
  BookmarksPage(),
  ProfilePage()
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
    return Scaffold(
      body: homeScreenTabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        currentIndex: _selectedIndex,
        onTap: (index) {
          _onItemTapped(index);
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("images/icon_home.svg"),
            activeIcon: SvgPicture.asset(
              "images/icon_home.svg",
              color: const Color(0xff6564DB),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("images/icon_search.svg"),
            activeIcon: SvgPicture.asset(
              "images/icon_search.svg",
              color: const Color(0xff6564DB),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("images/icon_bookmarks.svg"),
            activeIcon: SvgPicture.asset(
              "images/icon_bookmarks.svg",
              color: const Color(0xff6564DB),
            ),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("images/icon_profile.svg"),
            activeIcon: SvgPicture.asset(
              "images/icon_profile.svg",
              color: const Color(0xff6564DB),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
