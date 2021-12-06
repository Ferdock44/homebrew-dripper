import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';

CoffeeRecipe makeSweetMariasRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 30),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 15),
    RecipeStep("Cover and wait", 75),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Sweet Maria's",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makePTsRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 240g water", 30),
    RecipeStep("Cover and wait", 60),
    RecipeStep("Stir", 30),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe("PT's", 16, 240, "coarse ground coffee",
      "PT's recipe: makes one delicious cup", steps);
  return recipe;
}

CoffeeRecipe makeTexasCoffeeSchoolRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 500g water", 30),
    RecipeStep("Cover and wait", 50),
    RecipeStep("Stir", 30),
    RecipeStep("Cover and wait", 50),
    RecipeStep("Stir", 20),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Texas Coffee School",
      28,
      500,
      "coarse ground coffee",
      "TX Coffee School recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeHomegroundsRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 320g water", 30),
    RecipeStep("Cover and wait", 50),
    RecipeStep("Stir", 30),
    RecipeStep("Cover and wait", 60),
    RecipeStep("Stir", 30),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Homegrounds",
      20,
      320,
      "finely ground coffee",
      "The Homegrounds recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeTestRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 5),
    RecipeStep("Cover and wait", 5),
    RecipeStep("Stir", 5),
    RecipeStep("Cover and wait", 5),
    RecipeStep("Stir", 5),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Test Recipe",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

List<CoffeeRecipe> getAllRecipes() {
  return [
    makeSweetMariasRecipe(),
    makePTsRecipe(),
    makeTexasCoffeeSchoolRecipe(),
    makeHomegroundsRecipe(),
    makeTestRecipe(),
  ];
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes() {
    return getAllRecipes();
  }

  static convertsectomin(int n) {
    int minutes;
    minutes = n;
    minutes %= 3600;
    minutes = (n / 60).floor();
    return minutes;
  }

  static displaysec(int n) {
    int seconds;
    int results;
    seconds = n;
    n %= 3600;
    results = seconds % 60;
    return results;
  }
}
