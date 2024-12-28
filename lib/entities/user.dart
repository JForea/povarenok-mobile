class User {
  String username = '';
  String email = '';
  bool isAdmin = false;
  bool isAuthorized = false;

  User.unauthorized();

  User({required this.email, required this.isAdmin, required this.username}) {
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
}
