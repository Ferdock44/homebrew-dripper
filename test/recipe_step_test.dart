import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid recipe step', () {
    var test = RecipeStep("this is a test", 60);
    expect(test.text, "this is a test");
    expect(test.time, 60);
  });

  test('throws ArgumentError on negative number', () {
    expect(() => RecipeStep("this is a test", -1), throwsArgumentError);
  });
}
