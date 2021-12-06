// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Homebrew Dripper App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
    });

    /*
      Given I am on Test Recipe Screen
      Then I should see "Test Recipe"
      And I should see "22g - finely ground coffee"
      And I should see "360g - water"
      And I should see "The original recipe: makes one delicious cup"
      When I tap "Start"
      Then I should see "5"
      And I should see "Add 360g water"
      When 5 seconds has passed
      Then I should see "Cover and wait"
      When 5 seconds has passed
      Then I should see "Stir"
      When 5 seconds has passed
      Then I should see "Cover and wait"
      When 5 seconds has passed
      Then I should see "Stir"
      When 5 seconds has passed
      Then I should see "Enjoy your coffee!"
      And I should see "Done"
    */
    group("Happy Paths", () {
      test("should give instructions for Test Recipe", () async {
        expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");

        await driver.tap(find.text("Test Recipe"));

        final coffeeVolumeTextFinder = find.byValueKey('coffee-volume');
        final waterVolumeTextFinder = find.byValueKey('water-volume');
        final miscDetailsTextFinder = find.byValueKey('misc-details');
        final totalTimeTextFinder = find.byValueKey('total-time');

        expect(await driver.getText(coffeeVolumeTextFinder),
            "22g - finely ground coffee");
        expect(await driver.getText(waterVolumeTextFinder), "360g - water");
        expect(await driver.getText(miscDetailsTextFinder),
            "The original recipe: makes one delicious cup");
        expect(await driver.getText(totalTimeTextFinder), "Total: 0:25");

        final startButtonFinder = find.byValueKey('start-button');

        await driver.tap(startButtonFinder);

        final currentRecipeTextFinder = find.byValueKey('current-recipe-text');
        final timeTextFinder = find.byValueKey('time-text');

        expect(await driver.getText(timeTextFinder), "5");
        expect(await driver.getText(currentRecipeTextFinder), "Add 360g water");
        await Future.delayed(Duration(seconds: 5));
        expect(await driver.getText(currentRecipeTextFinder), "Cover and wait");
        await Future.delayed(Duration(seconds: 5));
        expect(await driver.getText(currentRecipeTextFinder), "Stir");
        await Future.delayed(Duration(seconds: 5));
        expect(await driver.getText(currentRecipeTextFinder), "Cover and wait");
        await Future.delayed(Duration(seconds: 5));
        expect(await driver.getText(currentRecipeTextFinder), "Stir");
        await Future.delayed(Duration(seconds: 5));

        final enjoyTextFinder = find.byValueKey('enjoy-text');
        final doneButtonFinder = find.byValueKey('done-button');

        expect(await driver.getText(enjoyTextFinder), "Enjoy your coffee!");
        expect(await driver.getText(doneButtonFinder), "Done");

        driver.tap(doneButtonFinder);
      });
    });

    group("Sad Paths", () {
      /*
      Given I am on Test Recipe Screen
      Then I should see "Test Recipe"
      And I should see "22g - finely ground coffee"
      And I should see "360g - water"
      And I should see "The original recipe: makes one delicious cup"
      When I tap "Start"
      Then I should see "5"
      And I should see "Add 360g water"
      When 5 seconds has not passed
      Then I should still see "Add 360g water"
    */
      test(
          "should not give instructions for Test Recipe when user does not wait long enough",
          () async {
        expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");

        await driver.tap(find.text("Test Recipe"));

        final coffeeVolumeTextFinder = find.byValueKey('coffee-volume');
        final waterVolumeTextFinder = find.byValueKey('water-volume');
        final miscDetailsTextFinder = find.byValueKey('misc-details');
        final totalTimeTextFinder = find.byValueKey('total-time');

        expect(await driver.getText(coffeeVolumeTextFinder),
            "22g - finely ground coffee");
        expect(await driver.getText(waterVolumeTextFinder), "360g - water");
        expect(await driver.getText(miscDetailsTextFinder),
            "The original recipe: makes one delicious cup");
        expect(await driver.getText(totalTimeTextFinder), "Total: 0:25");

        final startButtonFinder = find.byValueKey('start-button');

        await driver.tap(startButtonFinder);

        final currentRecipeTextFinder = find.byValueKey('current-recipe-text');
        final timeTextFinder = find.byValueKey('time-text');

        expect(await driver.getText(timeTextFinder), "5");
        expect(await driver.getText(currentRecipeTextFinder), "Add 360g water");
        await Future.delayed(Duration(seconds: 2));
        expect(await driver.getText(currentRecipeTextFinder), "Add 360g water");
      });
    });
  });
}
