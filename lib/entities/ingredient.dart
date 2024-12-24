class Ingredient {
  final String title;
  final String quanity;

  const Ingredient({
    required this.title,
    required this.quanity,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'title': String title,
        'quanity': String quanity,
      } =>
        Ingredient(
          title: title,
          quanity: quanity,
        ),
      _ => throw const FormatException('Failed to load ingredient.'),
    };
  }
}
