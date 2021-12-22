import 'dart:convert';

class FoodRecipe {
  final String name;
  final String images;
  final String rating;
  final String totalTime;

  FoodRecipe(this.name, this.images, this.rating, this.totalTime);

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
