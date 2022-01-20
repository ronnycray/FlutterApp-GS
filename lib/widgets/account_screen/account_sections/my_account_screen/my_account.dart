import 'package:GainSystemsApp/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MyAccountScreenWidget extends StatefulWidget {
  MyAccountScreenWidget({Key? key, required this.updateCurrentTub})
      : super(key: key);

  final Function updateCurrentTub;

  @override
  _MyAccountScreenWidgetState createState() => _MyAccountScreenWidgetState();
}

class _MyAccountScreenWidgetState extends State<MyAccountScreenWidget> {
  final boxDecorationIconMyAccountMenu = BoxDecoration(
      color: Color.fromRGBO(70, 59, 82, 1),
      borderRadius: BorderRadius.all(Radius.circular(20)));
  @override
  Widget build(BuildContext context) {
    void pushBtn(String newCurrentWidget) {
      widget.updateCurrentTub(newCurrentWidget);
    }

    return Scaffold(
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, vm) => SingleChildScrollView(
            child: Column(
          children: [
            _HeaderMyAccountWidget(updateCurrentTub: pushBtn),
            _ImageAccountSection(),
            SizedBox(height: 30),
            _SectionMenuMyAccountSettings(
                boxDecorationIconMyAccountMenu: boxDecorationIconMyAccountMenu,
                icon_person_outline_outlined: Icons.person_outline_outlined,
                textOfMyAccount: vm.user.firstName.toString(),
                presedFunction: () {
                  pushBtn('');
                }),
            SizedBox(height: 10),
            _SectionMenuMyAccountSettings(
                boxDecorationIconMyAccountMenu: boxDecorationIconMyAccountMenu,
                icon_person_outline_outlined: Icons.email_outlined,
                textOfMyAccount: vm.user.email.toString(),
                presedFunction: () {
                  pushBtn('');
                }),
            SizedBox(height: 10),
            _SectionMenuMyAccountSettings(
                boxDecorationIconMyAccountMenu: boxDecorationIconMyAccountMenu,
                icon_person_outline_outlined: Icons.phone_in_talk_outlined,
                textOfMyAccount: vm.user.phone.toString(),
                presedFunction: () {
                  pushBtn('');
                }),
            // SizedBox(height: 10),
            // _SectionMenuMyAccountSettings(
            //     boxDecorationIconMyAccountMenu: boxDecorationIconMyAccountMenu,
            //     icon_person_outline_outlined: Icons.location_on_outlined,
            //     textOfMyAccount: 'г. Москва. ул. Улицева, 28',
            //     presedFunction: () {
            //       pushBtn('');
            //     }),
            SizedBox(height: 15),
            _ButtonChangePassword(presedFunction: () {
              pushBtn('');
            }),
            SizedBox(height: 15),
            _ButtonLogOut(presedFunction: () {
              pushBtn('');
            })
          ],
        )),
      ),
    );
  }
}

class _ButtonLogOut extends StatefulWidget {
  const _ButtonLogOut({Key? key, required this.presedFunction})
      : super(key: key);

  final Function presedFunction;

  @override
  State<_ButtonLogOut> createState() => _ButtonLogOutState();
}

class _ButtonLogOutState extends State<_ButtonLogOut> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        // decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
          child:
              Text('Выход', style: TextStyle(fontSize: 16, color: Colors.red)),
        ),
      ),
    );
  }
}

class _ButtonChangePassword extends StatefulWidget {
  const _ButtonChangePassword({Key? key, required this.presedFunction})
      : super(key: key);

  final Function presedFunction;

  @override
  State<_ButtonChangePassword> createState() => _ButtonChangePasswordState();
}

class _ButtonChangePasswordState extends State<_ButtonChangePassword> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(228, 228, 228, 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
          child: Text('Сменить пароль', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}

class _SectionMenuMyAccountSettings extends StatefulWidget {
  const _SectionMenuMyAccountSettings(
      {Key? key,
      required this.boxDecorationIconMyAccountMenu,
      required this.icon_person_outline_outlined,
      required this.textOfMyAccount,
      required this.presedFunction})
      : super(key: key);

  final BoxDecoration boxDecorationIconMyAccountMenu;
  final IconData icon_person_outline_outlined;
  final String textOfMyAccount;
  final Function presedFunction;

  @override
  State<_SectionMenuMyAccountSettings> createState() =>
      _SectionMenuMyAccountSettingsState();
}

class _SectionMenuMyAccountSettingsState
    extends State<_SectionMenuMyAccountSettings> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.presedFunction('');
      },
      child: Container(
        height: 50,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 10,
                  child: Row(
                    children: [
                      Container(
                          decoration: widget.boxDecorationIconMyAccountMenu,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(widget.icon_person_outline_outlined,
                                color: Colors.white),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          widget.textOfMyAccount,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.keyboard_arrow_right_sharp),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageAccountSection extends StatefulWidget {
  const _ImageAccountSection({
    Key? key,
  }) : super(key: key);

  @override
  State<_ImageAccountSection> createState() => _ImageAccountSectionState();
}

class _ImageAccountSectionState extends State<_ImageAccountSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (context, vm) => Image.network(
                      vm.user.profilePicture.toString(),
                      width: 150,
                      height: 150,
                    )),
            SizedBox(height: 10),
            RichText(
                text: TextSpan(
              children: [
                TextSpan(
                    text: 'Изменить',
                    style: const TextStyle(
                        color: Color.fromRGBO(68, 168, 110, 1),
                        fontSize: 14,
                        fontStyle: FontStyle.normal))
              ],
              //   recognizer: ()
              // ..onTap = _pushButtonRegistration,
            )),
            SizedBox(height: 10),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, vm) => Text(
                vm.user.firstName.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontStyle: FontStyle.normal),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _HeaderMyAccountWidget extends StatefulWidget {
  const _HeaderMyAccountWidget({
    Key? key,
    required this.updateCurrentTub,
  }) : super(key: key);

  final Function updateCurrentTub;

  @override
  State<_HeaderMyAccountWidget> createState() => _HeaderMyAccountWidgetState();
}

class _HeaderMyAccountWidgetState extends State<_HeaderMyAccountWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        color: Color.fromRGBO(70, 59, 82, 1),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  widget.updateCurrentTub('accountScreen');
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Icon(Icons.arrow_back_sharp, color: Colors.white),
                ),
              ),
              SizedBox(width: 20),
              Text(
                'Мой аккаунт',
                style: TextStyle(
                    color: Colors.white, fontSize: 19, fontFamily: 'Gilroy'),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ));
  }
}
