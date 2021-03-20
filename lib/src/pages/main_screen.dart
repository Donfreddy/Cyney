import 'package:animations/animations.dart';
import 'package:cyney/src/pages/discover/discover.dart';
import 'package:cyney/src/pages/favorite/favorite.dart';
import 'package:cyney/src/pages/home/home.dart';
import 'package:cyney/src/pages/search/search.dart';
import 'package:cyney/src/pages/profile/setting.dart';
import 'package:cyney/src/utils/app_color.dart';
import 'package:cyney/src/utils/styles.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> pages = [Home(), Discover(), Search(), Favorite(), Setting()];

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
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bgColor,
        selectedItemColor: red,
        elevation: 4,
        unselectedItemColor: gray,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.homeOutline),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.gridOutline),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.searchOutline),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.heartOutline),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.personOutline),
            label: 'Profil',
          )
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
