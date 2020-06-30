import 'dart:ui';

import 'package:flutter/material.dart' hide Step;
import 'package:flutter_jianfeican/app/home/model/bean/recipe_bean.dart';
import 'package:flutter_jianfeican/app/home/model/bean/recipe_detain_main.dart';
import 'package:flutter_jianfeican/base/utils/color_utils.dart';
import 'package:flutter_jianfeican/base/utils/dimens.dart';
import 'package:flutter_jianfeican/base/utils/image_path_helper.dart';
import 'package:flutter_jianfeican/base/utils/screen_utils.dart';

/// TODO 补充背景图动态化效果
/// 菜谱详情
class RecipeDetailsPage extends StatefulWidget {
  final String _recipeId;

  RecipeDetailsPage(this._recipeId);

  @override
  State<StatefulWidget> createState() {
    /// TODO 不必要步骤
    return _RecipeDetailsPageState(_recipeId);
  }

  /// 菜谱详情入口
  ///
  /// recipeId : 菜谱id
  static void start(BuildContext context, String recipeId) {
    Navigator.push(context, new MaterialPageRoute<void>(
        // 新的页面
        builder: (BuildContext context) {
      return RecipeDetailsPage(recipeId);
    }));
  }
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  String _recipeId;
  List<RecipeDetailMainBean> mDetailsLists = [];

  _RecipeDetailsPageState(this._recipeId);

  @override
  void initState() {
    super.initState();
    getRecipeDetailsInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecipeRecipeWidget(mDetailsLists),
    );
  }

  /// 获取数据
  void getRecipeDetailsInfo() {
    // 当前菜谱
    Recipe recipe = Recipe.name(_recipeId, "手残党也能做出的美味");
    recipe.likeNum = 21;
    recipe.collectNum = 121;
    recipe.recipeImageId = "121";

    //当前材料
    List<Materials> material = [];
    for (int i = 0; i < 8; i++) {
      material.add(Materials("材料$i", "数量$i"));
    }

    //添加头部数据
    mDetailsLists
        .add(RecipeDetailMainBean.headerData(HeaderData(recipe, material)));

    //添加步骤
    for (int i = 0; i < 10; i++) {
      mDetailsLists.add(RecipeDetailMainBean.content(
          Step(i + 1, "imageId$i", "鲫鱼收拾干净 表面划几刀易于入味$i")));
    }

    // 添加尾部
    List<Recipe> relativeRecipes = [];
    for (int i = 0; i < 15; i++) {
      relativeRecipes.add(Recipe.name("$i", "菜谱名称$i"));
    }
    mDetailsLists.add(RecipeDetailMainBean.footerData(relativeRecipes));
  }
}

class RecipeRecipeWidget extends StatelessWidget {
  final List<RecipeDetailMainBean> _detailsLists;

  RecipeRecipeWidget(this._detailsLists);

  static const double TITLE_BAR_HEIGHT = 44;
  static const double NAVIGATION_BAR_HEIGHT = 60;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(ImagePath.wrap("ic_step"),
          width: ScreenUtils.getScreenWidth(context),
          height: ScreenUtils.getScreenWidth(context),
          fit: BoxFit.cover),
      Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: NAVIGATION_BAR_HEIGHT,
          child: ListView.builder(
              itemCount: _detailsLists.length,
              itemBuilder: (context, index) {
                RecipeDetailMainBean mainBean = _detailsLists[index];
                switch (mainBean.itemType) {
                  case RecipeDetailMainBean.TYPE_HEADER:
                    return _buildHeadWidget(context, mainBean.headerData);
                  case RecipeDetailMainBean.TYPE_FOOTER:
                    print("footer");
                    return _buildFooterWidget(mainBean.relativeRecipes);
                  default:
                    return _buildItemWidget(context, mainBean.step);
                }
              })),
      Column(children: <Widget>[
        Container(
          height: ScreenUtils.getStatusBarHeight(),
          color: Colors.black,
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          width: ScreenUtils.getScreenWidth(context),
          height: TITLE_BAR_HEIGHT,
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        ImagePath.wrap("back"),
                        width: 19,
                        height: 19,
                        fit: BoxFit.scaleDown,
                      )))),
          decoration: new BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                ColorUtils.parse("#000000", opacityRadio: 0.4),
                ColorUtils.parse("#000000", opacityRadio: 0)
              ])),
        ),
      ]),
      _buildBottomWidget(context)
    ]);
  }

  /// 头部
  Widget _buildHeadWidget(BuildContext context, HeaderData headerData) {
    Recipe currentRecipe = headerData.currentRecipe;
    List<Materials> materials = headerData.materials;
    double availableMaxWidth = ScreenUtils.getScreenWidth(context) - DIM_20 * 2;
    return Column(children: <Widget>[
      Container(
          width: ScreenUtils.getScreenWidth(context),
          height: ScreenUtils.getScreenWidth(context) -
              ScreenUtils.getStatusBarHeight() -
              14),
      ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          child: Container(
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(DIM_20, 14, DIM_20, 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Center(
                              child: Container(
                                  width: 30,
                                  height: 4,
                                  decoration: BoxDecoration(
                                      color: ColorUtils.parse("#C2BFCF",
                                          opacityRadio: 0.4),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2)))))),
                      Text(
                        currentRecipe.recipeName,
                        style: TextStyle(
                            color: ColorUtils.parse("#1E192F"),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Text(
                              "已有人${currentRecipe.likeNum}点赞 ${currentRecipe.collectNum}人收藏",
                              style: TextStyle(
                                  color: ColorUtils.parse("#C2BFCF"),
                                  fontSize: 12))),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: SizedBox(
                              width: availableMaxWidth,
                              height: availableMaxWidth * 125 / 335,
                              child: Stack(
                                children: <Widget>[
                                  ConstrainedBox(
                                      constraints: BoxConstraints.expand(),
                                      child:
                                          Image.asset(ImagePath.wrap("xq_bg"))),
                                  ConstrainedBox(
                                      constraints: BoxConstraints.expand(),
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 16, right: 16, top: 12),
                                          child: Column(children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                ClipOval(
                                                  child: Image.asset(
                                                    ImagePath.wrap("home_pic1"),
                                                    fit: BoxFit.cover,
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      "小爱私厨",
                                                      style: TextStyle(
                                                          color:
                                                              ColorUtils.parse(
                                                                  "#1E192F"),
                                                          fontSize: 14),
                                                    ))
                                              ],
                                            ),
                                            Expanded(
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10, bottom: 16),
                                                    child: Text(
                                                      "楚菜，湖北风味，以水产为本，鱼馔为主，汁浓芡亮，香鲜较辣，注重本色，菜式丰富，筵席众多，擅长蒸、煨、炸、烧、炒等烹调方法，具有滚、烂、鲜、醇、香、嫩…楚菜，湖北风味，以水产为本，鱼馔为主，汁浓芡亮，香鲜较辣，注重本色，菜式丰富，筵席众多，擅长蒸、煨、炸、烧、炒等烹调方法，具有滚、烂、鲜、醇、香、嫩…楚菜，湖北风味，以水产为本，鱼馔为主，汁浓芡亮，香鲜较辣，注重本色，菜式丰富，筵席众多，擅长蒸、煨、炸、烧、炒等烹调方法，具有滚、烂、鲜、醇、香、嫩…楚菜，湖北风味，以水产为本，鱼馔为主，汁浓芡亮，香鲜较辣，注重本色，菜式丰富，筵席众多，擅长蒸、煨、炸、烧、炒等烹调方法，具有滚、烂、鲜、醇、香、嫩…",
                                                      style: TextStyle(
                                                          color:
                                                              ColorUtils.parse(
                                                                  "#84838B"),
                                                          fontSize: 12),
                                                    )))
                                          ])))
                                ],
                              ))),
                      _buildMaterialListWidget(context, materials),
                      Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 6),
                          child: Text(
                            "烹饪步骤",
                            style: TextStyle(
                                color: ColorUtils.parse("#1E192F"),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ))))
    ]);
  }

  /// 尾部
  Widget _buildFooterWidget(List<Recipe> relativeRecipes) {
    return Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 20, top: 30, bottom: 16),
                  child: Text(
                    "相关菜谱",
                    style: TextStyle(
                        color: ColorUtils.parse("#1E192F"),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 16),
                  height: 138,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.only(
                                left: index == 0 ? 20 : 0, right: 16),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    child: Image.asset(
                                        ImagePath.wrap("home_pic1"),
                                        fit: BoxFit.cover))));
                      },
                      itemCount: relativeRecipes.length))
            ]));
  }

  /// 步骤
  Widget _buildItemWidget(BuildContext context, Step step) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(DIM_20, 12, DIM_20, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${step.index}/${step.totalStepCount}",
            style: TextStyle(color: ColorUtils.parse("#84838B"), fontSize: 16),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                child: AspectRatio(
                    aspectRatio: 335 / 205,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: Image.asset(ImagePath.wrap('ic_step'),
                            fit: BoxFit.cover))),
                width: ScreenUtils.getScreenWidth(context) - DIM_20 * 2,
              )),
          Text(step.stepDescription,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: ColorUtils.parse("#1E192F"),
                  fontSize: 16,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  /// 材料列表
  Widget _buildMaterialListWidget(
      BuildContext context, List<Materials> materials) {
    return Container(
        width: ScreenUtils.getScreenWidth(context),
        padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorUtils.parse("#F5F5F7")),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 11),
                  child: Text(
                    "需要材料",
                    style: TextStyle(
                        color: ColorUtils.parse("#1E192F"),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              ListView.separated(
                  shrinkWrap: true,
                  physics: new NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    Materials material = materials[index];

                    print(material.name);
                    return SizedBox(
                        height: 36,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                material.name,
                                style: TextStyle(
                                    color: ColorUtils.parse("#84838B"),
                                    fontSize: 14),
                              ),
                              Text(material.quantity,
                                  style: TextStyle(
                                      color: ColorUtils.parse("#84838B"),
                                      fontSize: 14))
                            ]));
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                        height: null,
                        thickness: 1,
                        color: ColorUtils.parse("#C2BFCF", opacityRadio: 0.2));
                  },
                  itemCount: materials.length),
            ]));
  }

  /// 底部组件
  _buildBottomWidget(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: Container(
          width: ScreenUtils.getScreenWidth(context),
          height: NAVIGATION_BAR_HEIGHT,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Row(
              children: <Widget>[_buildCollectWidget(), _buildLikeWidget()]),
        ));
  }

  /// 收藏组件
  Widget _buildCollectWidget() {
    return Expanded(
        flex: 3,
        child: Container(
            constraints: BoxConstraints.expand(),
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                color: ColorUtils.parse("#C2BFCF"),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  ImagePath.wrap("ic_add"),
                  width: 18,
                  height: 18,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "加入收藏夹",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ))
              ],
            )));
  }

  // 点赞组件
  Widget _buildLikeWidget() {
    return Expanded(
        flex: 1,
        child: Container(
            decoration: BoxDecoration(
                color: ColorUtils.parse("#F5F5F7"),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Center(
                child: Image.asset(
              ImagePath.wrap("xq_z"),
              width: 20,
              height: 20,
            ))));
  }
}
