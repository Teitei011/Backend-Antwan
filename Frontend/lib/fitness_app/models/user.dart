class User {
  String name;
  String email;
  String password;
  String googleId;
  String dateOfBirth;
  int height;
  int weight;
  String exercisesID;
  String dietID;
  bool admin; // true if admin, false if not

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.googleId,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
    required this.exercisesID,
    required this.dietID,
    required this.admin,
  });
}

// user example
final userTemplate = User(
    name: "Stefan",
    email: "stefantleal14@gmail.com",
    password: "fjdladsfsakf",
    googleId: "fjdladsfsakf",
    dateOfBirth: "24/08/1998",
    height: 169,
    weight: 53,
    exercisesID: "f24323432",
    dietID: "fjdladsfsakf",
    admin: true);
