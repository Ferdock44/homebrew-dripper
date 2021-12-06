//Test that the load recipes gives you the data you expect
//this should be dependent on the recipes that you actually want to have in the app

import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

void main() {
  test('loadRecipes should give back the recipes in my app', () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    // add whatever tests help give you confidence
    expect(recipes[0], isA<CoffeeRecipe>());
    expect(recipes[0].name, "Sweet Maria's");
    expect(recipes[0].coffeeVolumeGrams, 22);
    expect(recipes[0].waterVolumeGrams, 360);
    expect(
        recipes[0].miscDetails, "The original recipe: makes one delicious cup");
    expect(recipes[0].steps, isA<List<RecipeStep>>());
    expect(recipes[0].steps[0].text, "Add 360g water");
    expect(recipes[0].steps[0].time, 30);
    expect(recipes[0].steps[1].text, "Cover and wait");
    expect(recipes[0].steps[1].time, 90);
    expect(recipes[0].steps[2].text, "Stir");
    expect(recipes[0].steps[2].time, 15);
    expect(recipes[0].steps[3].text, "Cover and wait");
    expect(recipes[0].steps[3].time, 75);
    expect(recipes[0].steps[4].text, "Stir");
    expect(recipes[0].steps[4].time, 15);

    expect(recipes[1], isA<CoffeeRecipe>());
    expect(recipes[1].name, "PT's");
    expect(recipes[1].coffeeVolumeGrams, 16);
    expect(recipes[1].waterVolumeGrams, 240);
    expect(recipes[1].miscDetails, "PT's recipe: makes one delicious cup");
    expect(recipes[1].steps, isA<List<RecipeStep>>());

    expect(recipes[2], isA<CoffeeRecipe>());
    expect(recipes[2].name, "Texas Coffee School");
    expect(recipes[2].coffeeVolumeGrams, 28);
    expect(recipes[2].waterVolumeGrams, 500);
    expect(recipes[2].miscDetails,
        "TX Coffee School recipe: makes one delicious cup");
    expect(recipes[2].steps, isA<List<RecipeStep>>());

    expect(recipes[3], isA<CoffeeRecipe>());
    expect(recipes[3].name, "Homegrounds");
    expect(recipes[3].coffeeVolumeGrams, 20);
    expect(recipes[3].waterVolumeGrams, 320);
    expect(recipes[3].miscDetails,
        "The Homegrounds recipe: makes one delicious cup");
    expect(recipes[3].steps, isA<List<RecipeStep>>());

    expect(recipes[4], isA<CoffeeRecipe>());
    expect(recipes[4].name, "Test Recipe");
    expect(recipes[4].coffeeVolumeGrams, 22);
    expect(recipes[4].waterVolumeGrams, 360);
    expect(
        recipes[4].miscDetails, "The original recipe: makes one delicious cup");
    expect(recipes[4].steps, isA<List<RecipeStep>>());
    expect(recipes[4].steps[0].text, "Add 360g water");
    expect(recipes[4].steps[0].time, 5);
    expect(recipes[4].steps[1].text, "Cover and wait");
    expect(recipes[4].steps[1].time, 5);
    expect(recipes[4].steps[2].text, "Stir");
    expect(recipes[4].steps[2].time, 5);
    expect(recipes[4].steps[3].text, "Cover and wait");
    expect(recipes[4].steps[3].time, 5);
    expect(recipes[4].steps[4].text, "Stir");
    expect(recipes[4].steps[4].time, 5);
  });

  test('converts 260 seconds into minutes subracting leftover seconds', () {
    var seconds = CoffeeData.convertsectomin(260);
    expect(seconds, 4);
  });

  test('converts 260 seconds into seconds subracting minutes', () {
    var seconds = CoffeeData.displaysec(260);
    expect(seconds, 20);
  });
}
