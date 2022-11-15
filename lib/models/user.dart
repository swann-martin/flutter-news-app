class User {
  final String imagePath;
  final String firstName;
  final String lastName;
  final String email;
  final String about;
  final bool isDarkMode;

  const User(
      {required this.imagePath,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.about,
      required this.isDarkMode});
}
