class User {
  int id = 0;
  String username = '';
  String email = '';
  bool isAdmin = false;
  bool authorized = false;

  User.unauthorized();

  User(
      {required this.email,
      required this.id,
      required this.isAdmin,
      required this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'username': String username,
        'email': String email,
        'isAdmin': bool isAdmin,
      } =>
        User(
          id: id,
          username: username,
          email: email,
          isAdmin: isAdmin,
        ),
      _ => throw const FormatException('Failed to load recipe user.'),
    };
  }
}
