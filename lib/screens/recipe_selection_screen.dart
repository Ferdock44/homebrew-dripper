import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = TextStyle(
        fontFamily: "Kollektif.ttf",
        fontWeight: FontWeight.bold,
        color: Color(0xFF4C748B),
        fontSize: 24.0);
    return Scaffold(
      backgroundColor: Color(0xFFE2E2E2),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Text("Coffee Recipes",
                key: Key("coffee-recipes"),
                textAlign: TextAlign.center,
                style: defaultStyle),
          ),
          Container(
            margin: const EdgeInsets.all(18),
            padding: const EdgeInsets.all(8),
            width: 200.0,
            height: 300.0,
            decoration: myBoxDecoration(),
            child: RecipeList(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text("Resources",
                textAlign: TextAlign.center, style: defaultStyle),
          ),
          Container(
            margin: const EdgeInsets.all(18),
            padding: const EdgeInsets.all(8),
            width: 200.0,
            height: 246.0,
            decoration: myBoxDecoration(),
            child: ResourceList(),
          ),
        ],
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (CoffeeRecipe recipe in recipes)
          ListTile(
              title: Text(recipe.name,
                  style: TextStyle(
                      fontFamily: "Montserrat.ttf",
                      color: Color(0xFF4C748B),
                      fontSize: 14.0)),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeDetailScreen(recipe)),
                );
              })
      ],
    );
  }
}

class ResourceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = TextStyle(
        fontFamily: "Montserrat.ttf", color: Color(0xFF4C748B), fontSize: 14.0);
    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(
              text: "Coffee",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch("https://en.wikipedia.org/wiki/Coffee");
                }),
          TextSpan(
              text: "Grinders",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch(
                      "https://en.wikipedia.org/wiki/Coffee_preparation#Grinding");
                }),
          TextSpan(
              text: "Kettles",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch("https://en.wikipedia.org/wiki/Kettle");
                }),
          TextSpan(
              text: "Homebrew Dripper",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch("https://en.wikipedia.org/wiki/Brewed_coffee");
                }),
        ],
      ),
    );
  }
}
