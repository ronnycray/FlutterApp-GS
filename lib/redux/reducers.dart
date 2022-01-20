import 'package:GainSystemsApp/redux/actions.dart';
import 'package:GainSystemsApp/redux/app_state.dart';
import 'package:GainSystemsApp/schemas/userNode.dart';

AppState reducer(AppState state, dynamic action) {
  if (action is SetUserInformation) {
    return AppState(user: action.user, business: state.business);
  } else if (action is UpdateCurrentBusiness) {
    return AppState(user: state.user, business: action.business);
  }
  return AppState(
      user: User(
          email: '',
          firstName: '',
          id: 1,
          phone: '',
          profilePicture:
              'https://cdn3.iconfinder.com/data/icons/avatars-15/64/_Ninja-2-512.png',
          businesses: []),
      business: null);
}
