class Recipe {
  final int id;
  final String title;
  final String imageURL;
  final String description;
  final String authorName;
  final int categoryID;
  final int likes;
  final int time;

  const Recipe({
    required this.id,
    required this.title,
    required this.imageURL,
    required this.description,
    required this.authorName,
    required this.categoryID,
    required this.likes,
    required this.time,
  });

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
        ),
      _ => throw const FormatException('Failed to load recipe.'),
    };
  }
}
