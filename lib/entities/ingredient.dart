class Ingredient {
  final String name;
  final String count;

  const Ingredient({
    required this.name,
    required this.count,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'count': String count,
      } =>
        Ingredient(
          name: name,
          count: count,
        ),
      _ => throw const FormatException('Failed to load ingredient.'),
    };
  }
}
