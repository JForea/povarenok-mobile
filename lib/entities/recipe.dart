import 'package:povarenok_mobile/entities/Ingredient.dart';
import 'package:povarenok_mobile/entities/user.dart';

class Recipe {
  final int id;
  final String name;
  final String img;
  final String description;
  final String manual;
  final int categoryID;
  //final int likes;
  final int time;
  final List<Ingredient> ingredients;
  final User author;

  const Recipe({
    required this.id,
    required this.name,
    required this.img,
    required this.description,
    required this.manual,
    required this.categoryID,
    //required this.likes,
    required this.time,
    required this.ingredients,
    required this.author,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'category': int category,
        'img': String img,
        'description': String description,
        'manual': String manual,
        'time': int time,
        'ingredients': List<dynamic> ingredients,
        'author': dynamic author,
        //'likes': int likes,
      } =>
        Recipe(
          id: id,
          name: name,
          img: img,
          description: description,
          manual: manual,
          author: User.authorFromJson(author as Map<String, dynamic>),
          categoryID: category,
          //likes: likes,
          time: time,
          ingredients: ingredients
              .map((ingredient) =>
                  Ingredient.fromJson(ingredient as Map<String, dynamic>))
              .toList(),
        ),
      _ => throw const FormatException('Failed to load recipe.'),
    };
  }
}
