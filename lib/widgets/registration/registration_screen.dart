import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:email_validator/email_validator.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:GainSystemsApp/graphql/base/mutation/registration_user.dart';

class RegistrationScreenWidget extends StatefulWidget {
  const RegistrationScreenWidget(
      {Key? key, required this.setAuthenticationToken})
      : super(key: key);
  final Function setAuthenticationToken;

  @override
  _RegistrationScreenWidgetState createState() =>
      _RegistrationScreenWidgetState();
}

class _RegistrationScreenWidgetState extends State<RegistrationScreenWidget> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final passwordConfirmationTextController = TextEditingController();
  String? errorEmailText = null;
  String? errorPasswordText = null;
  String? errorPasswordConfirmText = null;
  bool isEmail(String input) => EmailValidator.validate(input);

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

  TextStyle _errorStyleText() =>
      TextStyle(color: Colors.red, fontSize: 16, fontFamily: 'Gilroy');

  void setToken(dynamic newToken) {
    widget.setAuthenticationToken(newToken.toString());
  }

  @override
  Widget build(BuildContext context) {
    const _outlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)));
    return Scaffold(
      backgroundColor: const Color.fromRGBO(70, 59, 82, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 74),
            const Padding(
                padding: EdgeInsets.only(left: 48, right: 48),
                child: Text(
                  'Добро пожаловать 👋🏻',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(height: 20),
            const Padding(
                padding: EdgeInsets.only(left: 55, right: 55),
                child: Text(
                  'Введите данные для регистрации в приложении',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Gilroy',
                  ),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(height: 45),
            Padding(
              padding: EdgeInsets.only(left: 55, right: 55),
              child: TextField(
                  controller: emailTextController,
                  decoration: InputDecoration(
                    errorText: errorEmailText,
                    filled: true,
                    fillColor: Color.fromRGBO(248, 248, 248, 1),
                    enabledBorder: _outlineInputBorder,
                    focusedBorder: _outlineInputBorder,
                    errorStyle: _errorStyleText(),
                    hintText: 'E-mail',
                  )),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 55, right: 55),
              child: TextField(
                  controller: passwordTextController,
                  obscureText: true,
                  decoration: InputDecoration(
                    errorText: errorPasswordText,
                    filled: true,
                    fillColor: Color.fromRGBO(248, 248, 248, 1),
                    enabledBorder: _outlineInputBorder,
                    focusedBorder: _outlineInputBorder,
                    errorStyle: _errorStyleText(),
                    hintText: 'Пароль',
                  )),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 55, right: 55),
              child: TextField(
                  controller: passwordConfirmationTextController,
                  obscureText: true,
                  decoration: InputDecoration(
                    errorText: errorPasswordConfirmText,
                    filled: true,
                    fillColor: Color.fromRGBO(248, 248, 248, 1),
                    enabledBorder: _outlineInputBorder,
                    focusedBorder: _outlineInputBorder,
                    errorStyle: _errorStyleText(),
                    hintText: 'Подтвертиде пароль',
                  )),
            ),
            SizedBox(height: 213),
            Padding(
              padding: const EdgeInsets.only(right: 55, left: 55),
              child: Mutation(
                options: MutationOptions(
                  document: gql(registrationUserMutation),
                  // or do something with the result.data on completion
                  onCompleted: (dynamic resultData) {
                    print('resultData ${resultData}');
                    if (resultData != null) {
                      print('YEP!!!!, ${resultData}');
                      if (resultData['registrationUser']
                              ['registrationSuccess'] ==
                          true) {
                        setToken(resultData['registrationUser']['token']);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/main', (Route<dynamic> route) => false);
                      } else {
                        setState(() {
                          errorEmailText =
                              '${resultData['registrationUser']['error']['message']}';
                          errorPasswordText =
                              '${resultData['registrationUser']['error']['message']}';
                          errorPasswordConfirmText = '';
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
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 14, bottom: 14),
                          child: const Text('Зарегистрироваться',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center),
                        ),
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
                                    errorEmailText = 'Поле почты не заполнено';
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
                              else if (passwordTextController.text !=
                                  passwordConfirmationTextController.text)
                                {
                                  setState(() {
                                    errorPasswordText = 'Пароли не совпадают';
                                    errorPasswordConfirmText =
                                        'Пароли не совпадают';
                                  })
                                }
                              else
                                {
                                  runMutation(<String, String>{
                                    'email': emailTextController.text,
                                    'password': passwordTextController.text,
                                    'uid': "${emailTextController.text}12345",
                                    'deviceId':
                                        "${emailTextController.text}12345"
                                  }),
                                }
                            },
                        style: _buttonStyleWidget()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Есть аккаунт? ',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    TextSpan(
                      text: 'Войти',
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontStyle: FontStyle.normal),
                      recognizer: TapGestureRecognizer()
                        ..onTap = _pushButtonLogin,
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  void _pushButtonLogin() {
    Navigator.of(context).pop('/firstLaunch');
  }
}
