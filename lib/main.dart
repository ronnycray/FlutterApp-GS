import 'package:GainSystemsApp/redux/app_state.dart';
import 'package:GainSystemsApp/redux/reducers.dart';
import 'package:GainSystemsApp/schemas/userNode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'widgets/gain_systems_app.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:redux/redux.dart' as redux;

void main() async {
  await initHiveForFlutter();
  final redux.Store<AppState> store = redux.Store(reducer,
      initialState: AppState(
          user: User(
              email: '',
              firstName: '',
              id: 0,
              phone: '',
              profilePicture:
                  'https://cdn3.iconfinder.com/data/icons/avatars-15/64/_Ninja-2-512.png',
              businesses: []),
          business: null));
  runApp(StoreProvider(store: store, child: GainSystemsApp()));
}
