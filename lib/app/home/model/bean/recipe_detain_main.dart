import 'recipe_bean.dart';

/// 菜谱详情步骤
class Step {
  int index = 0;
  String imgId;
  String stepDescription;
  int totalStepCount = 10;

  Step(this.index, this.imgId, this.stepDescription);
}

/// 菜谱需要材料
class Materials {
  String name;
  String quantity;

  Materials(this.name, this.quantity);
}

/// 头部数据
class HeaderData {
  Recipe _currentRecipe;
  List<Materials> _materials;

  HeaderData(this._currentRecipe, this._materials);

  List<Materials> get materials => _materials;

  Recipe get currentRecipe => _currentRecipe;
}

/// 菜谱详情数据总集
class RecipeDetailMainBean {
  static const int TYPE_HEADER = 0;
  static const int TYPE_CONTENT = 1;
  static const int TYPE_FOOTER = 2;

  HeaderData _headerData;
  Step _step;
  List<Recipe> _relativeRecipes;
  int _itemType;

  RecipeDetailMainBean.headerData(this._headerData) {
    _itemType = TYPE_HEADER;
  }

  RecipeDetailMainBean.footerData(this._relativeRecipes) {
    _itemType = TYPE_FOOTER;
  }

  RecipeDetailMainBean.content(this._step) {
    _itemType = TYPE_CONTENT;
  }

  List<Recipe> get relativeRecipes => _relativeRecipes;

  Step get step => _step;

  HeaderData get headerData => _headerData;

  int get itemType => _itemType;
}
