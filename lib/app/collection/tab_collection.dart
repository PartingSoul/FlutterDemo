import 'package:flutter/material.dart';

class TabCollectionWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabCollectionWidgetState();
}

class _TabCollectionWidgetState extends State<TabCollectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('收藏')), body: CollectListWidget());
  }
}

class CollectListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CollectListWidgetState();
}

class _CollectListWidgetState extends State<CollectListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return CollectItemWidget();
        },
        itemCount: 20,
        itemExtent: 120,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20));
  }
}

class CollectItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(children: <Widget>[
          ClipRRect(
              child: FadeInImage.assetNetwork(
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  placeholder: "resource/image/item_icon.jpg",
                  image:
                      "https://puui.qpic.cn/fans_admin/0/3_482668729_1585145086535/0"),
              borderRadius: BorderRadius.circular(16)),
          Expanded(
              child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 12),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "夏日清爽减脂餐夏日清爽减脂餐夏日清爽减脂餐夏日清爽减脂餐夏日清爽减脂餐夏日清爽减脂餐夏日清爽减脂餐",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF1E192F),
                              fontWeight: FontWeight.w600),
                        ),
                        Row(children: <Widget>[
                          Text(
                            "点赞293",
                            style: TextStyle(
                                color: Color(0xFF84838B), fontSize: 12),
                          ),
                          Padding(
                              padding: EdgeInsetsDirectional.only(start: 16),
                              child: Text("收藏390",
                                  style: TextStyle(
                                      color: Color(0xFF84838B), fontSize: 12)))
                        ])
                      ])))
        ]));
  }
}
