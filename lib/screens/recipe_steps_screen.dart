import 'dart:async';
import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

class RecipeStepsScreen extends StatefulWidget {
  CoffeeRecipe recipe;

  RecipeStepsScreen(this.recipe);

  @override
  _RecipeStepsScreenState createState() => _RecipeStepsScreenState();
}

class _RecipeStepsScreenState extends State<RecipeStepsScreen> {
  int currentStep;
  List<RecipeStep> remainingSteps;
  int stepTimeRemaining;
  Timer timer;

  @override
  void initState() {
    super.initState();

    int totalSteps = widget.recipe.steps.length;

    currentStep = 0;
    remainingSteps = widget.recipe.steps;

    //set the starting value of the timer
    stepTimeRemaining = widget.recipe.steps[currentStep].time;

    //make timer that ticks every one seconds
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if timer reached zero
      if (stepTimeRemaining <= 1) {
        //increase step
        currentStep++;

        //if we finished
        if (currentStep >= totalSteps) {
          //cancel timer
          timer.cancel();

          //navigate to done screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoneScreen()),
          );
        } else {
          //if we did not finish yet
          //adjust the timer
          //reduce the list of remaining steps
          stepTimeRemaining = widget.recipe.steps[currentStep].time;
          remainingSteps = widget.recipe.steps.sublist(currentStep);
          setState(() {});
        }
      } else {
        //adjust time remaining by one
        stepTimeRemaining = stepTimeRemaining - 1;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RecipeStep currentRecipeStep = widget.recipe.steps[currentStep];

    return Scaffold(
        backgroundColor: Color(0xFF4C748B),
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
          ),
          Center(
              child: Text("$stepTimeRemaining",
                  key: Key("time-text"),
                  style: TextStyle(fontSize: 96, color: Colors.white))),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
          ),
          Center(
              child: Text("${currentRecipeStep.text}",
                  key: Key("current-recipe-text"),
                  style: TextStyle(fontSize: 24, color: Colors.white))),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
          ),
          Text("Steps", style: TextStyle(color: Colors.white)),
          for (RecipeStep step in remainingSteps)
            Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration:
                    (step == currentRecipeStep) ? myBoxDecoration() : null,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("${step.text}",
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                      Text(
                          "${CoffeeData.convertsectomin(step.time)}:${CoffeeData.displaysec(step.time)}",
                          style: TextStyle(fontSize: 12, color: Colors.white))
                    ]))
        ]));
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10.0)));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
