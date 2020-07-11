import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_jianfeican/app/home/model/bean/menu_cate_bean.dart';
import 'package:flutter_jianfeican/app/home/search/search_page.dart';
import 'package:flutter_jianfeican/base/http/http_helper.dart';
import 'package:flutter_jianfeican/base/utils/color_utils.dart';
import 'package:flutter_jianfeican/base/utils/image_path_helper.dart';
import 'package:flutter_jianfeican/base/utils/string_utils.dart';

import 'model/bean/home_bean.dart';
import 'model/bean/recipe_bean.dart';
import 'recipe_details/recipe_details_page.dart';

/// Tab 首页
class TabHomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabHomeWidgetState();
}

class _TabHomeWidgetState extends State<TabHomeWidget> {
  final List<MenuCateBean> mMenuCateItemLists = [
    MenuCateBean('257354379', '减脂健身', ImagePath.wrap('home_js')),
    MenuCateBean('257354375', '美容养颜', ImagePath.wrap('home_my')),
    MenuCateBean('257352874', '营养素食', ImagePath.wrap('home_ss')),
  ];

  List<Recipe> mRecipeLists = [];

  @override
  void initState() {
    super.initState();
    getRecipeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQueryData.fromWindow(window).padding.top)),
          _buildTopSearchWidget(context),
          _buildHomeWidget(context)
        ],
      ),
    );
  }

  /// 顶部搜索
  Widget _buildTopSearchWidget(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, new MaterialPageRoute<void>(
              // 新的页面
              builder: (BuildContext context) {
            return new SearchWidget();
          }));
        },
        child: Padding(
            padding: EdgeInsets.only(left: 20, top: 6, right: 20, bottom: 6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23.5),
              child: Container(
                color: Color(0x33C2BFCF),
                height: 44,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(ImagePath.wrap('home_search'),
                          width: 24, height: 24),
                      Text("搜索菜谱/食材",
                          style: TextStyle(color: Color(0xFFC2BFCF)))
                    ]),
              ),
            )));
  }

  /// 内容
  Widget _buildHomeWidget(BuildContext context) {
    return Expanded(
        child: CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return MenuCateItemWidget(mMenuCateItemLists[index]);
                }, childCount: mMenuCateItemLists.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1.4))),
        SliverFixedExtentList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return HomeRecipeItemWidget(mRecipeLists[index], index,
                _onCollectStateChange, _onItemClick);
          }, childCount: mRecipeLists.length),
          itemExtent: 335,
        )
      ],
    ));
  }

  /// 收藏状态 发生改变
  _onCollectStateChange(int index) {
    setState(() {
      Recipe recipe = mRecipeLists[index];
      recipe.isCollected = !recipe.isCollected;
    });
  }

  /// 菜谱item被点击
  _onItemClick(int index) {
    Recipe recipe = mRecipeLists[index];
    print(recipe.id);
    if (recipe == null || StringUtils.isEmpty(recipe.id)) {
      return;
    }
    RecipeDetailsPage.start(context, recipe.id);
  }

  /// 获取菜谱数据
  void getRecipeData() async {
    BaseHttpResponse response = await httpRequest.getRequest(
        GetContentsBySubClassId,
        data: {"id": "257352874", "page": "0"});
    HomeBean bean = HomeBean.fromMap(response.responseJson);
    mRecipeLists = bean.list;
    setState(() {});
  }
}

class MenuCateItemWidget extends StatelessWidget {
  final MenuCateBean _menuCate;

  MenuCateItemWidget(this._menuCate);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(_menuCate.imageUrl, width: 50, height: 50),
        Text(_menuCate.title,
            style: TextStyle(fontSize: 12, color: Color(0xFF84838B)))
      ],
    );
  }
}

class HomeRecipeItemWidget extends StatelessWidget {
  final Recipe _recipe;
  final Function(int) _onItemClick;
  final Function(int) _onCollectWidgetClick;
  final int _index;

  HomeRecipeItemWidget(
      this._recipe, this._index, this._onCollectWidgetClick, this._onItemClick);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _onItemClick(_index);
        },
        child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 16),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(children: <Widget>[
                  ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: Image.network(getNetImagePath(_recipe.imageid),
                          fit: BoxFit.cover)),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorUtils.parse("#000000", opacityRadio: 0.2)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, top: 24, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _recipe.name,
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
                                      child: Image.network(
                                          getNetImagePath(
                                              _recipe.user?.imageid),
                                          width: 28,
                                          height: 28,
                                          fit: BoxFit.cover)),
                                  Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text(
                                        _recipe.user.nickname,
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
                      right: 20,
                      bottom: 24,
                      child: CollectedWidget(
                        index: _index,
                        isCollected: _recipe.isCollected,
                        onClick: _onCollectWidgetClick,
                      )),
                ]))));
  }
}

class CollectedWidget extends StatelessWidget {
  CollectedWidget(
      {@required this.index, this.isCollected, @required this.onClick});

  final bool isCollected;

  final Function(int) onClick;

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onClick(index);
        },
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
                            ImagePath.wrap('ic_collect'),
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
}
