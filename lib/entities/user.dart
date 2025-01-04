class User {
  int? id;
  String username = '';
  String email = '';
  List<int> favourites = [];
  List<int> recipes = [];
  bool isAdmin = false;
  bool isAuthorized = false;
  bool infoUpdated = false;

  User.unauthorized();

  User({
    required this.email,
    required this.isAdmin,
    required this.username,
    this.id,
    this.favourites = const [],
    this.recipes = const [],
  }) {
    isAuthorized = true;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'username': String username,
        'email': String email,
        'isAdmin': bool isAdmin,
      } =>
        User(
          username: username,
          email: email,
          isAdmin: isAdmin,
        ),
      _ => throw const FormatException('Failed to load user.'),
    };
  }

  factory User.authorFromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'username': String username,
        'email': String email,
        'admin': bool isAdmin,
      } =>
        User(
          id: id,
          username: username,
          email: email,
          isAdmin: isAdmin,
        ),
      _ => throw const FormatException('Failed to load user.'),
    };
  }
}
