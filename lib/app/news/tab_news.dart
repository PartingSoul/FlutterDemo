import 'package:flutter/material.dart';

class TabNewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabNewWidgetState();
}

class _TabNewWidgetState extends State<TabNewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("资讯")),
        body: ListView.separated(
            padding: EdgeInsetsDirectional.only(start: 20, end: 20),
            itemBuilder: (BuildContext context, int index) {
              return index % 2 == 0
                  ? ThreePicNewsItemWidget()
                  : OnePicNewsItemWidget();
            },
            separatorBuilder: (BuildContext context, int index) {
              /// TODO Divider 的 height 有一个默认高度为 16 需要注意
              return Divider(
                  height: null,
                  thickness: 1,
                  /// TODO 上面已经设置过左右间距了
                  //indent: 20,
                  //endIndent: 20,
                  color: Color(0xFFF5F5F5));
            },
            itemCount: 40));
  }
}

/*
 TODO 1. 以下两个 Cell 没有必要写成 StatefulWidget
      2. 进一步思考利用构造函数传值
      以上两点下一次会说怎么做，可以先思考
*/
class OnePicNewsItemWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OnePicNewsItemWidgetState();
}

class _OnePicNewsItemWidgetState extends State<OnePicNewsItemWidget> {
  _OnePicNewsItemWidgetState();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 16, bottom: 16),
        child: SizedBox(
            width: 96,
            height: 96,
            child: Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                    child: FadeInImage.assetNetwork(
                        width: 96,
                        height: 96,
                        fit: BoxFit.cover,
                        placeholder: "resource/image/item_icon.jpg",
                        image:
                            "https://puui.qpic.cn/fans_admin/0/3_482668729_1585145086535/0"),
                    borderRadius: BorderRadius.circular(16)),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "隔离14天没有用！！无症状感染者再度点亮河南隔离14天没有用隔离14天没有用隔离14天没有用",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xFF1E192F), fontSize: 16),
                              ),
                              Text(
                                "大观新闻",
                                style: TextStyle(color: Color(0xFF84838B)),
                              )
                            ])))
              ],
            )));
  }
}

class ThreePicNewsItemWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ThreePicNewsItemWidgetState();
  }
}

class _ThreePicNewsItemWidgetState extends State<ThreePicNewsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final imgWidth = (constraints.maxWidth - 8 * 2) / 3;
      return Padding(
          padding: EdgeInsetsDirectional.only(top: 16, bottom: 16),
          child: Column(children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  "杭州天香楼的东坡肉、楼外楼的西湖醋鱼名扬中外杭州天香楼的东坡肉、。在这些杭帮老字号里。在这些杭帮老字号里",
                  style: TextStyle(color: Color(0xFF1E192F), fontSize: 16),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ClipRRect(
                    child: FadeInImage.assetNetwork(
                        width: imgWidth,
                        height: imgWidth,
                        fit: BoxFit.cover,
                        placeholder: "resource/image/item_icon.jpg",
                        image:
                            "https://puui.qpic.cn/fans_admin/0/3_482668729_1585145086535/0"),
                    borderRadius: BorderRadius.circular(16)),
                ClipRRect(
                    child: FadeInImage.assetNetwork(
                        width: imgWidth,
                        height: imgWidth,
                        fit: BoxFit.cover,
                        placeholder: "resource/image/item_icon.jpg",
                        image:
                            "https://puui.qpic.cn/fans_admin/0/3_482668729_1585145086535/0"),
                    borderRadius: BorderRadius.circular(16)),
                ClipRRect(
                    child: FadeInImage.assetNetwork(
                        width: imgWidth,
                        height: imgWidth,
                        fit: BoxFit.cover,
                        placeholder: "resource/image/item_icon.jpg",
                        image:
                            "https://puui.qpic.cn/fans_admin/0/3_482668729_1585145086535/0"),
                    borderRadius: BorderRadius.circular(16))
              ],
            )
          ]));
    });
  }
}
