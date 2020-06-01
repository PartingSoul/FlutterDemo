import 'package:flutter/material.dart';

class TabHomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabHomeWidgetState();
}

class _TabHomeWidgetState extends State<TabHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('首页')));
  }
}
