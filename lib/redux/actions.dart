import 'package:GainSystemsApp/schemas/businessNode.dart';
// import 'package:GainSystemsApp/schemas/teamNode.dart';
import 'package:GainSystemsApp/schemas/userNode.dart';

class SetUserInformation {
  final User user;

  SetUserInformation({required this.user});
}

class UpdateCurrentBusiness {
  final int currentBusinessID;
  final Business business;

  UpdateCurrentBusiness(
      {required this.currentBusinessID, required this.business});
}
