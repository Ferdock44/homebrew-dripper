import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

class RecipeDetailScreen extends StatelessWidget {
  CoffeeRecipe recipe;

  RecipeDetailScreen(this.recipe);

  @override
  Widget build(BuildContext context) {
    int total = 0;
    int totalvalue = 0;
    for (RecipeStep step in recipe.steps) {
      total = int.parse("${step.time}");
      totalvalue += total;
    }

    return Scaffold(
      backgroundColor: Color(0xFFE2E2E2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF546E7A)),
          onPressed: () => Navigator.pop(context, RecipeSelectionScreen),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(13),
            padding: const EdgeInsets.all(10),
            width: 250.0,
            height: 130.0,
            decoration: myBoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 1, 10, 20),
                  child: Text(recipe.name,
                      style: TextStyle(fontSize: 18, color: Color(0xFF546E7A))),
                ),
                //Divider(color: Colors.black),
                Text("${recipe.coffeeVolumeGrams}" + "g - " + recipe.grindSize,
                    key: Key("coffee-volume"),
                    style: TextStyle(color: Color(0xFF546E7A))),
                Text("${recipe.waterVolumeGrams}" + "g - water",
                    key: Key("water-volume"),
                    style: TextStyle(fontSize: 14, color: Color(0xFF546E7A))),
                Text(recipe.miscDetails,
                    key: Key("misc-details"),
                    style: TextStyle(fontSize: 10, color: Color(0xFF546E7A))),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Steps", style: TextStyle(color: Color(0xFF546E7A))),
                Text(
                    "Total: ${CoffeeData.convertsectomin(totalvalue)}:${CoffeeData.displaysec(totalvalue)}",
                    key: Key("total-time"),
                    style: TextStyle(color: Color(0xFF546E7A))),
              ],
            ),
          ),
          for (RecipeStep step in recipe.steps)
            Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(10),
              decoration: myBoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${step.text}",
                      style: TextStyle(color: Color(0xFF546E7A))),
                  Text(
                      "${CoffeeData.convertsectomin(step.time)}:${CoffeeData.displaysec(step.time)}",
                      style: TextStyle(color: Color(0xFF546E7A))),
                ],
              ),
            ),
          ButtonTheme(
              minWidth: 80.0,
              height: 46.0,
              child: RaisedButton(
                key: Key("start-button"),
                // padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text("Start"),
                textColor: Colors.white,
                color: Color((0xFF546E7A)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeStepsScreen(recipe)),
                  );
                },
              )),
        ],
      ),
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
      border: Border.all(
        width: 2,
        color: Color((0xFF546E7A)),
      ),
      borderRadius: BorderRadius.all(Radius.circular(10.0)));
}
