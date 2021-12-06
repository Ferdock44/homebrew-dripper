class RecipeStep {
  String text;
  int time;

  RecipeStep(text, time) {
    // Add any rules to reject invalid values
    if (time <= 0) throw ArgumentError();

    this.text = text;
    this.time = time;
  }
}
