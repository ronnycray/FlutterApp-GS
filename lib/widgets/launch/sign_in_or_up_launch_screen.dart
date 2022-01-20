import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:GainSystemsApp/graphql/base/mutation/authentication_user.dart';
import 'dart:math';

class SignInOrUpLaunchScreenWidget extends StatelessWidget {
  const SignInOrUpLaunchScreenWidget(
      {Key? key, required this.setAuthenticationToken})
      : super(key: key);
  final Function setAuthenticationToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(70, 59, 82, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: 74),
            _ImageSignInOrUpWidjet(),
            SizedBox(height: 20),
            _TitleTextWidget(),
            SizedBox(height: 30),
            _DescriptionTextWidget(),
            SizedBox(height: 30),
            _SignInButtonWidget(setAuthenticationToken: setAuthenticationToken),
            SizedBox(height: 28),
            _RegistrationTextOfferWidget(),
          ]),
        ),
      ),
    );
  }
}

class _RegistrationTextOfferWidget extends StatefulWidget {
  const _RegistrationTextOfferWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_RegistrationTextOfferWidget> createState() =>
      _RegistrationTextOfferWidgetState();
}

class _RegistrationTextOfferWidgetState
    extends State<_RegistrationTextOfferWidget> {
  void _pushButtonRegistration() {
    Navigator.of(context).pushNamed('/registration');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60, right: 68),
      child: Center(
          child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Нет аккаунта? ',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            TextSpan(
              text: 'Зарегистрируйтесь',
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontStyle: FontStyle.normal),
              recognizer: TapGestureRecognizer()
                ..onTap = _pushButtonRegistration,
            ),
          ],
        ),
      )),
    );
  }
}

class _TextButtonLoginWidget extends StatelessWidget {
  const _TextButtonLoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 78, right: 78, top: 15, bottom: 15),
      child: const Text('Войти',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.center),
    );
  }
}

class _SignInButtonWidget extends StatefulWidget {
  const _SignInButtonWidget({Key? key, required this.setAuthenticationToken})
      : super(key: key);

  final Function setAuthenticationToken;

  @override
  State<_SignInButtonWidget> createState() => _SignInButtonWidgetState();
}

class _SignInButtonWidgetState extends State<_SignInButtonWidget> {
  Future<void> _showModalLoginWidget() {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return _ModalLoginWidget(
              setAuthenticationToken: widget.setAuthenticationToken);
        });
  }

  void _pushButtonSignIn() {
    _showModalLoginWidget();
  }

  ButtonStyle _buttonStyleWidget() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      backgroundColor:
          MaterialStateProperty.all(const Color.fromRGBO(56, 255, 139, 0.7)),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const _TextButtonLoginWidget(),
        onPressed: _pushButtonSignIn,
        style: _buttonStyleWidget());
  }
}

class _DescriptionTextWidget extends StatelessWidget {
  const _DescriptionTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 55, right: 55),
      child: Center(
        child: Text(
            'Войдите в свою учетную запись или зарегистрируйтесь в нашем приложении',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center),
      ),
    );
  }
}

class _TitleTextWidget extends StatelessWidget {
  const _TitleTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Center(
        child: Text('Войти или зарегистрироваться',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                fontFamily: 'Gilroy')),
      ),
    );
  }
}

class _ImageSignInOrUpWidjet extends StatelessWidget {
  const _ImageSignInOrUpWidjet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var enter_image2 = "assets/images/enter_image.svg";
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 30),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(241, 125, 59, 1),
                Color.fromRGBO(195, 51, 231, 1),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 61, right: 61, top: 40, bottom: 40),
          child: SvgPicture.asset(enter_image2),
        ),
      ),
    );
  }
}

class _ModalLoginWidget extends StatefulWidget {
  const _ModalLoginWidget({Key? key, required this.setAuthenticationToken})
      : super(key: key);

  final Function setAuthenticationToken;

  @override
  State<_ModalLoginWidget> createState() => _ModalLoginWidgetState();
}

class _ModalLoginWidgetState extends State<_ModalLoginWidget> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String? errorEmailText = null;
  String? errorPasswordText = null;
  var rng = new Random();

  bool isEmail(String input) => EmailValidator.validate(input);

  ButtonStyle _buttonStyleWidget() {
    return ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(111, 207, 151, 1)),
        shadowColor: MaterialStateProperty.all(Colors.transparent));
  }

  TextStyle _errorStyleText() =>
      TextStyle(color: Colors.red, fontSize: 16, fontFamily: 'Gilroy');

  @override
  Widget build(BuildContext context) {
    const _outlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)));
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 45),
            _LoginTextOfModalWidget(),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 55, right: 55),
              child: TextField(
                  controller: emailTextController,
                  enabled: true,
                  decoration: InputDecoration(
                    errorText: errorEmailText,
                    errorStyle: _errorStyleText(),
                    focusedBorder: _outlineInputBorder,
                    enabledBorder: _outlineInputBorder,
                    hintText: 'E-mail',
                  )),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 55, right: 55),
              child: TextField(
                controller: passwordTextController,
                obscureText: true,
                decoration: InputDecoration(
                  errorText: errorPasswordText,
                  errorStyle: _errorStyleText(),
                  enabledBorder: _outlineInputBorder,
                  focusedBorder: _outlineInputBorder,
                  hintText: 'Пароль',
                ),
              ),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(bottom: 69),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Mutation(
                    options: MutationOptions(
                      document: gql(authenticationUserMutation),
                      // or do something with the result.data on completion
                      onCompleted: (dynamic resultData) {
                        print('resultData ${resultData}');
                        if (resultData != null) {
                          print('YEP!!!!, ${resultData}');
                          if (resultData['authenticationUser']
                                  ['authenticationStatus'] ==
                              true) {
                            widget.setAuthenticationToken(
                                resultData['authenticationUser']['token']);
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/main', (Route<dynamic> route) => false);
                          } else {
                            setState(() {
                              errorEmailText =
                                  '${resultData['authenticationUser']['error']['message']}';
                              errorPasswordText =
                                  '${resultData['authenticationUser']['error']['message']}';
                            });
                          }
                        }
                      },
                    ),
                    builder: (
                      RunMutation runMutation,
                      QueryResult? result,
                    ) =>
                        ElevatedButton(
                            // onPressed: _pushButtonLogin,
                            onPressed: () => {
                                  if (!isEmail(emailTextController.text))
                                    {
                                      setState(() {
                                        errorEmailText =
                                            'Почта введена не коректно';
                                      })
                                    }
                                  else if (emailTextController.text.isEmpty)
                                    {
                                      setState(() {
                                        errorEmailText =
                                            'Поле почты не заполнено';
                                      })
                                    }
                                  else if (passwordTextController.text.isEmpty)
                                    {
                                      setState(() {
                                        errorPasswordText =
                                            'Поле пароля не заполнено';
                                      })
                                    }
                                  else if (emailTextController.text ==
                                      passwordTextController.text)
                                    {
                                      setState(() {
                                        errorPasswordText =
                                            'Поле пароля и email одинаковые';
                                        errorEmailText =
                                            'Поле пароля и email одинаковые';
                                      })
                                    }
                                  else
                                    {
                                      print('RUN AUTH!!!!!!!!!!!'),
                                      runMutation(<String, String>{
                                        'email': emailTextController.text,
                                        'password': passwordTextController.text,
                                        'uid':
                                            "${emailTextController.text}12345",
                                        'deviceId':
                                            "${emailTextController.text}12345"
                                      }),
                                    }
                                },
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 30, right: 30, bottom: 15, top: 15),
                              child: Text(
                                'Войти',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Gilroy',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            style: _buttonStyleWidget()),
                  ),
                ),
                const SizedBox(width: 30),
                const Padding(
                  padding: EdgeInsets.only(right: 44),
                  child: _ForgotPasswordButtonWidget(),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _ForgotPasswordButtonWidget extends StatelessWidget {
  const _ForgotPasswordButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: 'Забыл пароль?',
      style: const TextStyle(fontSize: 14, color: Colors.black),
      recognizer: TapGestureRecognizer()..onTap = () {},
    ));
  }
}

class _EmailInputFieldWidget extends StatefulWidget {
  const _EmailInputFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_EmailInputFieldWidget> createState() => _EmailInputFieldWidgetState();
}

class _EmailInputFieldWidgetState extends State<_EmailInputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 55, right: 55),
      child: TextFormField(
          enabled: true,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(248, 248, 248, 1),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: 'E-mail',
          )),
    );
  }
}

class _LoginTextOfModalWidget extends StatelessWidget {
  const _LoginTextOfModalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 55, right: 233),
      child: Text(
        'Войти',
        style: TextStyle(
          color: Colors.black,
          fontSize: 36,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontFamily: 'Gilroy',
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
