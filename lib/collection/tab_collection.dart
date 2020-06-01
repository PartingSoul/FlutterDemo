import 'package:flutter/material.dart';

class TabCollectionWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabCollectionWidgetState();
}

class _TabCollectionWidgetState extends State<TabCollectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('收藏')));
  }
}
