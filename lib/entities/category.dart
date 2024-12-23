class JsonCategory {
  final int id;
  final String title;
  final int color;

  const JsonCategory({
    required this.id,
    required this.title,
    required this.color,
  });

  factory JsonCategory.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
        'color': String color,
      } =>
        JsonCategory(
          id: id,
          title: title,
          color: int.parse('FF$color', radix: 16),
        ),
      _ => throw const FormatException('Failed to load category.'),
    };
  }
}
