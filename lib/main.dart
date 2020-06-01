import 'package:flutter/material.dart';

import 'collection/tab_collection.dart';
import 'home/tab_home.dart';
import 'news/tab_news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '减肥餐',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomNavigateWidget(),
    );
  }
}

class BottomNavigateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomNavigateWidgetState();
}

class _BottomNavigateWidgetState extends State<BottomNavigateWidget> {
  int _currentIndex = 0;
  List<Widget> _tabPages = List<Widget>();

  @override
  void initState() {
    super.initState();
    _tabPages
      ..add(TabHomeWidget())
      ..add(TabNewWidget())
      ..add(TabCollectionWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _tabPages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "resource/image/tab_home_def@3x.png",
                    width: 20,
                    height: 20,
                  ),
                  activeIcon: Image.asset(
                    "resource/image/tab_home@3x.png",
                    width: 20,
                    height: 20,
                  ),
                  title: Padding(
                      padding: EdgeInsets.only(top: 5), child: Text('首页'))),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'resource/image/tab_zx_def@3x.png',
                    width: 20,
                    height: 20,
                  ),
                  activeIcon: Image.asset(
                    "resource/image/tab_zx@3x.png",
                    width: 20,
                    height: 20,
                  ),
                  title: Padding(
                      padding: EdgeInsets.only(top: 5), child: Text('资讯'))),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'resource/image/tab_sc_def@3x.png',
                    width: 20,
                    height: 20,
                  ),
                  activeIcon: Image.asset(
                    "resource/image/tab_sc@3x.png",
                    width: 20,
                    height: 20,
                  ),
                  title: Padding(
                      padding: EdgeInsets.only(top: 5), child: Text('收藏')))
            ],
            currentIndex: _currentIndex,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            selectedItemColor: Color(0xFF00AD53),
            unselectedItemColor: Color(0xFF84838B),
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            }));
  }
}
