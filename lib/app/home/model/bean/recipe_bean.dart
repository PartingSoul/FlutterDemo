class Recipe {
  String id;
  String recipeName;
  bool isCollected = false;
  int collectNum;
  int likeNum;
  String description;
  String recipeImageId;

  Recipe();

  Recipe.name(this.id, this.recipeName);
}
