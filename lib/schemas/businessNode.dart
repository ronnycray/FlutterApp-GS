import 'package:GainSystemsApp/schemas/roleNode.dart';
import 'package:GainSystemsApp/schemas/teamNode.dart';

class Business {
  Business(
      {required this.id,
      required this.title,
      required this.roles,
      required this.teams,
      this.scoped_type,
      this.description,
      this.address,
      this.services,
      this.region,
      this.city,
      this.email,
      this.phone,
      this.website,
      this.image});

  int id;
  String title;
  String? address = '';
  String? city = '';
  String? description = '';
  String? email = '';
  String? phone = '';
  String? region = '';
  String? scoped_type = '';
  String? services = '';
  String? website = '';
  String? image = '';
  List<Role> roles = [];
  List<Team> teams = [];
}
