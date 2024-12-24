import 'package:povarenok_mobile/entities/Ingredient.dart';
import 'package:povarenok_mobile/entities/recipe_step.dart';

class Recipe {
  final int id;
  final String title;
  final String imageURL;
  final String description;
  final String authorName;
  final int categoryID;
  final int likes;
  final int time;
  final List<Ingredient> ingredients;
  final List<RecipeStep> steps;

  const Recipe(
      {required this.id,
      required this.title,
      required this.imageURL,
      required this.description,
      required this.authorName,
      required this.categoryID,
      required this.likes,
      required this.time,
      required this.ingredients,
      required this.steps});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
        'imageURL': String imageURL,
        'description': String description,
        'authorName': String authorName,
        'categoryID': int categoryID,
        'likes': int likes,
        'time': int time,
        'ingredients': List<dynamic> ingredients,
        'steps': List<dynamic> steps,
      } =>
        Recipe(
          id: id,
          title: title,
          imageURL: imageURL,
          description: description,
          authorName: authorName,
          categoryID: categoryID,
          likes: likes,
          time: time,
          ingredients: ingredients
              .map((ingredient) =>
                  Ingredient.fromJson(ingredient as Map<String, dynamic>))
              .toList(),
          steps: steps
              .map((step) => RecipeStep.fromJson(step as Map<String, dynamic>))
              .toList(),
        ),
      _ => throw const FormatException('Failed to load recipe.'),
    };
  }
}
