class RecipeStep {
  final int id;
  final String description;

  const RecipeStep({
    required this.id,
    required this.description,
  });

  factory RecipeStep.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'description': String description,
      } =>
        RecipeStep(
          id: id,
          description: description,
        ),
      _ => throw const FormatException('Failed to load recipe step.'),
    };
  }
}
