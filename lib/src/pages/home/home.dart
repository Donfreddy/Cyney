import 'package:cyney/src/pages/home/movies/movies_screen.dart';
import 'package:cyney/src/pages/home/series/series_screen.dart';
import 'package:cyney/src/utils/app_color.dart';
import 'package:cyney/src/utils/styles.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<Widget> pages;
  TabController _controller;

  @override
  void initState() {
    super.initState();

    pages = [MoviesScreen(), SeriesScreen()];
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Cyney',
      //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //   ),
      //   elevation: 0,
      //   centerTitle: true,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 10),
      //       child: IconButton(
      //           icon: Icon(EvaIcons.searchOutline), onPressed: () {}),
      //     )
      //   ],
      // ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context) * 0.09) +
                EdgeInsets.only(top: screenWidth(context) * 0.09, bottom: 5),
            child: Container(
              height: 45,
              //margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                //color: gray,
                borderRadius: BorderRadius.circular(Radius.s12 * 2),
                //border: Border.all(color: red),
                color: gray.withOpacity(0.2),
              ),
              child: Theme(
                data: ThemeData(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                ),
                child: TabBar(
                  controller: _controller,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(Radius.s12 * 2),
                    color: red,
                  ),
                  onTap: (int _) {},
                  labelColor: white,
                  unselectedLabelColor: gray,
                  // isScrollable: true,
                  tabs: [
                    Tab(
                      //text: 'Movies',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(EvaIcons.videoOutline),
                          SizedBox(width: 5),
                          Text('Movies'),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(EvaIcons.tvOutline),
                          SizedBox(width: 5),
                          Padding(
                            padding: EdgeInsets.only(top: Insets.xs),
                            child: Text('TV Series'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              children: pages,
            ),
          ),
        ],
      ),
    );
  }
}
