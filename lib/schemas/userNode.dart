import 'package:GainSystemsApp/schemas/businessNode.dart';

class User {
  User(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.phone,
      required this.profilePicture,
      required this.businesses});

  int id;
  String email;
  String firstName;
  String phone;
  String profilePicture;
  List<Business> businesses;
}
