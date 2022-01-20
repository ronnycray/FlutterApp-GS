import 'package:flutter/material.dart';
// import 'package:graphql/client.dart';

import 'home.dart';
import 'launch/first_launch_screen.dart';
import 'launch/sign_in_or_up_launch_screen.dart';
import 'registration/registration_screen.dart';
import './client_provider.dart';

final graphqlEndpoint =
    'https://gainsystems-dev.germanywestcentral.cloudapp.azure.com/graphql';

class GainSystemsApp extends StatefulWidget {
  const GainSystemsApp({Key? key}) : super(key: key);

  @override
  State<GainSystemsApp> createState() => _GainSystemsAppState();
}

class _GainSystemsAppState extends State<GainSystemsApp> {
  var authenticationToken = '';

  void setAuthenticationToken(String newToken) {
    setState(() {
      authenticationToken = newToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClientProvider(
      uri: graphqlEndpoint,
      authenticationToken: authenticationToken,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(fontFamily: 'Gilroy'),
          home: const FirstLaunchScreenWidget(),
          routes: {
            '/firstLaunch': (context) => const FirstLaunchScreenWidget(),
            '/enterLaunch': (context) => SignInOrUpLaunchScreenWidget(
                  setAuthenticationToken: setAuthenticationToken,
                ),
            '/registration': (context) => RegistrationScreenWidget(
                setAuthenticationToken: setAuthenticationToken),
            // '/general': (context) => GeneralScreenWidget(
            //       currentTub: 0,
            //     ),
            '/main': (context) => MainPageScreenWidget()
          },
          initialRoute: '/firstLaunch'),
    );
  }
}
