import 'package:GainSystemsApp/schemas/memberNode.dart';
import 'package:GainSystemsApp/schemas/memberType.dart';
import 'package:GainSystemsApp/schemas/roleNode.dart';

class Team {
  Team(
      {required this.id,
      required this.email,
      required this.role,
      required this.member,
      required this.memberType});

  int id;
  String email;
  Role role;
  Member member;
  MemberType memberType;
}
