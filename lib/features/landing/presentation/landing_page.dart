import 'package:ecassion/features/bookmarks/presentation/bookmarks_page.dart';
import 'package:ecassion/features/home/presentation/pages/home_page.dart';
import 'package:ecassion/features/profile/presentation/profile_page.dart';
import 'package:ecassion/features/search/presentation/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeScreenTabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
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