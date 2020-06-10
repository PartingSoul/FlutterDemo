import 'dart:ui';

import 'package:flutter/material.dart';

class TabHomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabHomeWidgetState();
}

class _TabHomeWidgetState extends State<TabHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQueryData.fromWindow(window).padding.top)),
          buildTopSearchWidget(),
          buildHomeWidget(context)
        ],
      ),
    );
  }
}

//Widget buildMenu() {
//  return Row(
//      mainAxisAlignment: MainAxisAlignment.spaceAround,
//      children: <Widget>[
//        Image.asset(
//          "resource/image/home_pic1.png",
//          fit: BoxFit.cover,
//          width: 80,
//          height: 80,
//        ),
//        Image.asset(
//          "resource/image/home_pic1.png",
//          fit: BoxFit.cover,
//          width: 80,
//          height: 80,
//        ),
//        Image.asset(
//          "resource/image/home_pic1.png",
//          fit: BoxFit.cover,
//          width: 80,
//          height: 80,
//        ),
//      ]);
//}

Widget buildTopSearchWidget() {
  return Padding(
      padding: EdgeInsets.only(left: 20, top: 6, right: 20, bottom: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(23.5),
        child: Container(
          color: Color(0x33C2BFCF),
          height: 44,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("resource/image/home_search.png",
                    width: 24, height: 24),
                Text("搜索菜谱/食材", style: TextStyle(color: Color(0xFFC2BFCF)))
              ]),
        ),
      ));
}

Widget buildHomeWidget(BuildContext context) {
  return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.only(top: 16),
          itemBuilder: (BuildContext context, int index) {
            /*
                TODO 考虑到这里 Cell 是信息流 Cell，数据会有变化
                     应参考新闻页面的 Cell 写法独立出去
                     并思考新闻页面关于 Cell 构建提出的问题
            */
            return Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 16),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(children: <Widget>[
                      Image.asset("resource/image/home_pic1.png",
                          fit: BoxFit.cover),
                      Padding(
                          padding:
                              EdgeInsets.only(left: 20, top: 24, right: 20),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "美味营养成功率高的一道家…美味营养成功率高的一道家…美味营养成功率高的一道家…",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 22),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: <Widget>[
                                      ClipOval(
                                          child: Image.asset(
                                              "resource/image/zx_pic8.png",
                                              width: 28,
                                              height: 28,
                                              fit: BoxFit.cover)),
                                      Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            "小圆食记",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 12),
                                          ))
                                    ],
                                  ))
                            ],
                          )),
                      Positioned(
                          right: 20, bottom: 24, child: CollectedWidget())
                    ])));
          },
          itemCount: 30));
}

/*
 TODO 1. 下述类没有必要写成 StatefulWidget
      2. 进一步思考利用构造函数传值
      以上两点下一次会说怎么做，可以先思考
*/
class CollectedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CollectedWidgetState();
}

class _CollectedWidgetState extends State<CollectedWidget> {
  bool isCollected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _onClick,
        child: SizedBox(
            width: 44,
            height: 44,
            child: ClipOval(
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xB0F5F5F7)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "resource/image/ic_collect.png",
                            width: 19,
                            height: 19,
                            color: Color(isCollected ? 0xFF00AD53 : 0xFF84838B),
                          ),
                          Text(
                            "123",
                            style: TextStyle(
                                color: Color(
                                    isCollected ? 0xFF00AD53 : 0xFF84838B),
                                fontSize: 8),
                          )
                        ])))));
  }

  _onClick() {
    isCollected = !isCollected;
    print("2121 $isCollected");
    setState(() {});
  }
}