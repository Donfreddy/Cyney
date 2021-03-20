import 'package:animations/animations.dart';
import 'package:cyney/src/pages/home/movies/movies_screen.dart';
import 'package:cyney/src/pages/home/series/series_screen.dart';
import 'package:cyney/src/utils/app_color.dart';
import 'package:cyney/src/utils/styles.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentVal = 0;
  List<Widget> tabs = [MoviesScreen(), SeriesScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageTransitionSwitcher(
            duration: Times.short,
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
                FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            ),
            child: tabs[currentVal],
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight(context) * 0.05),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Radius.s08),
                    boxShadow: [
                      BoxShadow(
                        color: black.withOpacity(0.1),
                        blurRadius: 8.0,
                        offset: Offset(0.0, 3.0),
                      )
                    ]),
                child: CupertinoSlidingSegmentedControl(
                  children: {
                    0: Icon(
                      currentVal < 0.5 ? EvaIcons.video : EvaIcons.videoOutline,
                      color: currentVal < 0.5 ? white : red,
                    ),
                    1: Icon(
                      currentVal > 0.5 ? EvaIcons.tv : EvaIcons.tvOutline,
                      color: currentVal > 0.5 ? white : red,
                    ),
                  },
                  thumbColor: red,
                  backgroundColor: white,
                  groupValue: currentVal,
                  onValueChanged: (int value) {
                    setState(() {
                      currentVal = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
