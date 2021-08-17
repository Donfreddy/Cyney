import 'package:animations/animations.dart';
import 'package:cyney/src/pages/discover/discover.dart';
import 'package:cyney/src/pages/favorite/favorite.dart';
import 'package:cyney/src/pages/home/home.dart';
import 'package:cyney/src/pages/search/search.dart';
import 'package:cyney/src/pages/profile/setting.dart';
import 'package:cyney/src/utils/styles.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  NavScreen({Key key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  final _screens = [Home(), Discover(), Search(), Favorite(), Setting()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: Times.short,
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: [
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.homeOutline),
            activeIcon: Icon(EvaIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.gridOutline),
            activeIcon: Icon(EvaIcons.grid),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.searchOutline),
            activeIcon: Icon(EvaIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.heartOutline),
            activeIcon: Icon(EvaIcons.heart),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.personOutline),
            activeIcon: Icon(EvaIcons.person),
            label: 'Profil',
          )
        ],
      ),
    );
  }
}
