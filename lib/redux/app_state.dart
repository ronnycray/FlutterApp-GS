import 'package:GainSystemsApp/schemas/businessNode.dart';
import 'package:GainSystemsApp/schemas/userNode.dart';

class AppState {
  final User user;
  final Business? business;

  AppState({required this.user, required this.business});
}
