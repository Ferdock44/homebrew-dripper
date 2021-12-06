import 'package:flutter/material.dart';
import 'recipe_selection_screen.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = TextStyle(
        fontFamily: "Montserrat.ttf", color: Color(0xFF4C748B), fontSize: 18.0);
    return Scaffold(
      backgroundColor: Color(0xFFE2E2E2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 242, bottom: 242),
                child: Text("Enjoy your coffee!",
                    key: Key("enjoy-text"), style: defaultStyle)),
            ListTile(
                title: Text("Done",
                    key: Key("done-button"),
                    textAlign: TextAlign.center,
                    style: defaultStyle),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipeSelectionScreen()));
                })
          ],
        ),
      ),
    );
  }
}
