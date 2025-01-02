class JsonCategory {
  final int id;
  final String title;
  final int color;

  const JsonCategory({
    required this.id,
    required this.title,
    required this.color,
  });
}

final List<String> categories = [
  'Все рецепты',
  'Салат',
  'Первое блюдо',
  'Второе блюдо',
  'Десерт',
  'Выпечка',
  'Закуска',
];
