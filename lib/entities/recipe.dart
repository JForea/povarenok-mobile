import 'dart:convert';

import 'package:povarenok_mobile/entities/ingredient.dart';
import 'package:povarenok_mobile/entities/user.dart';

class Recipe {
  int? id;
  String name = '';
  String img = '';
  String description = '';
  String manual = '';
  int category = 0;
  //final int likes;
  int? time;
  List<Ingredient> ingredients = [];
  User? author;

  Recipe({
    required this.id,
    required this.name,
    required this.img,
    required this.description,
    required this.manual,
    required this.category,
    //required this.likes,
    required this.time,
    required this.ingredients,
    required this.author,
  });

  Recipe.create();

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
          category: category,
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

  Map<String, String> toJson() {
    return {
      'name': name,
      'category': category.toString(),
      'img': img,
      'description': description,
      if (time != null) 'time': time.toString(),
      'manual': manual,
      'ingredients': json.encode(
          ingredients.map((ingredient) => ingredient.toJson()).toList()),
    };
  }
}
