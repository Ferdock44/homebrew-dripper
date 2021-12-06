import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid coffee recipe', () {
    //make a coffee recipe
    List<RecipeStep> steps = [
      RecipeStep("Add 360g water", 5),
      RecipeStep("Cover and wait", 5),
      RecipeStep("Stir", 5),
      RecipeStep("Cover and wait", 5),
      RecipeStep("Stir", 5),
    ];
    var testRecipe = CoffeeRecipe(
        "Test Recipe", 20, 21, "finely ground coffee", "misc details", steps);

    //check that it has the right data
    expect(testRecipe.name, "Test Recipe");
    expect(testRecipe.coffeeVolumeGrams, 20);
    expect(testRecipe.waterVolumeGrams, 21);
    expect(testRecipe.grindSize, "finely ground coffee");
    expect(testRecipe.miscDetails, "misc details");

    //check steps
    expect(testRecipe.steps[0].text, "Add 360g water");
    expect(testRecipe.steps[0].time, 5);
    expect(testRecipe.steps[1].text, "Cover and wait");
    expect(testRecipe.steps[1].time, 5);
    expect(testRecipe.steps[2].text, "Stir");
    expect(testRecipe.steps[2].time, 5);
    expect(testRecipe.steps[3].text, "Cover and wait");
    expect(testRecipe.steps[3].time, 5);
    expect(testRecipe.steps[4].text, "Stir");
    expect(testRecipe.steps[4].time, 5);
  });

  test('throws ArgumentError on negative number', () {
    List<RecipeStep> steps = [
      RecipeStep("Add 360g water", 5),
      RecipeStep("Cover and wait", 5),
      RecipeStep("Stir", 5),
      RecipeStep("Cover and wait", 5),
      RecipeStep("Stir", 5),
    ];

    expect(
        () => CoffeeRecipe("Test Recipe", -20, -21, "finely ground coffee",
            "misc details", steps),
        throwsArgumentError);
  });
}
