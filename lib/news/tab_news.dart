import 'package:flutter/material.dart';

class TabNewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabNewWidgetState();
}

class _TabNewWidgetState extends State<TabNewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('资讯')));
  }
}
