import 'package:GainSystemsApp/redux/app_state.dart';
import 'package:GainSystemsApp/schemas/businessNode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SettingsBusinessScreenWidget extends StatefulWidget {
  SettingsBusinessScreenWidget({
    Key? key,
    required this.updateCurrentTub,
  }) : super(key: key);

  final Function updateCurrentTub;

  @override
  _SettingsBusinessScreenWidgetState createState() =>
      _SettingsBusinessScreenWidgetState();
}

class _SettingsBusinessScreenWidgetState
    extends State<SettingsBusinessScreenWidget> {
  final boxDecorationSectionAccountMenu = BoxDecoration(
      color: Color.fromRGBO(240, 240, 240, 1),
      borderRadius: BorderRadius.all(Radius.circular(10)));
  final iconSectionAccountMenu = Icons.people;
  final String textSectionAccountMenu = '';
  void updateScreen(String namePage) {
    print('UPDATEEE ${namePage}');
    widget.updateCurrentTub(namePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, vm) => SingleChildScrollView(
            child: Column(children: [
          _HeaderSettingsBusinessWidget(
            updateCurrentTub: widget.updateCurrentTub,
            business: vm.business!,
            currentBusinessSettingsID: vm.business!.id,
          ),
          _TitleSettingsDescriptionBusinessWidget(
            business: vm.business!,
          ),
          SizedBox(height: 30),
          _ButtonSectionSettingsWidget(
            boxDecorationSectionAccountMenu: boxDecorationSectionAccountMenu,
            iconSectionAccountMenu: Icons.people,
            textSectionAccountMenu: 'Моя команда',
            updateFunction: () {
              widget.updateCurrentTub('myTeamMembersScreen');
            },
          ),
          SizedBox(height: 15),
          _ButtonSectionSettingsWidget(
            boxDecorationSectionAccountMenu: boxDecorationSectionAccountMenu,
            iconSectionAccountMenu: Icons.add_box_outlined,
            textSectionAccountMenu: 'Настройка ролей',
            updateFunction: () {
              widget.updateCurrentTub('roleSettingsBusinessScreen');
            },
          ),
          SizedBox(height: 15),
          _ButtonSectionSettingsWidget(
            boxDecorationSectionAccountMenu: boxDecorationSectionAccountMenu,
            iconSectionAccountMenu: Icons.settings,
            textSectionAccountMenu: 'Настройка бизнеса',
            updateFunction: () {
              widget.updateCurrentTub('settingsSelectionBusinessScreen');
            },
          )
        ])),
      ),
    );
  }
}

class _ButtonSectionSettingsWidget extends StatelessWidget {
  const _ButtonSectionSettingsWidget(
      {Key? key,
      required this.boxDecorationSectionAccountMenu,
      required this.iconSectionAccountMenu,
      required this.textSectionAccountMenu,
      required this.updateFunction})
      : super(key: key);

  final BoxDecoration boxDecorationSectionAccountMenu;
  final IconData iconSectionAccountMenu;
  final String textSectionAccountMenu;
  final Function updateFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        updateFunction();
      },
      child: Container(
        height: 60,
        width: 334,
        decoration: boxDecorationSectionAccountMenu,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(iconSectionAccountMenu),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('${textSectionAccountMenu}'),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.keyboard_arrow_right_sharp),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class _TitleSettingsDescriptionBusinessWidget extends StatelessWidget {
  const _TitleSettingsDescriptionBusinessWidget(
      {Key? key, required this.business})
      : super(key: key);

  final Business business;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, vm) => _ContentSettingsBusinessWidget(
            business: vm.business!,
          ),
        ),
      ),
    );
  }
}

class _ContentSettingsBusinessWidget extends StatelessWidget {
  const _ContentSettingsBusinessWidget({
    Key? key,
    required this.business,
  }) : super(key: key);

  final Business business;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            child: Center(
                child: Text(business.title[0].toUpperCase(),
                    style: TextStyle(fontSize: 40, color: Colors.white))),
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                color: Color.fromRGBO(70, 59, 82, 1),
                borderRadius: BorderRadius.all(Radius.circular(100)))),
        SizedBox(height: 10),
        RichText(
            text: TextSpan(
          children: [
            TextSpan(
                text: business.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))
          ],
          //   recognizer: ()
          // ..onTap = _pushButtonRegistration,
        )),
        SizedBox(height: 10),
        RichText(
            text: TextSpan(
          children: [
            TextSpan(
                text: business.description,
                style: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                    fontSize: 14,
                    fontWeight: FontWeight.normal))
          ],
          //   recognizer: ()
          // ..onTap = _pushButtonRegistration,
        )),
      ],
    );
  }
}

class _HeaderSettingsBusinessWidget extends StatelessWidget {
  const _HeaderSettingsBusinessWidget({
    Key? key,
    required this.currentBusinessSettingsID,
    required this.business,
    required this.updateCurrentTub,
  }) : super(key: key);

  final int currentBusinessSettingsID;
  final Business business;
  final Function updateCurrentTub;

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
                  updateCurrentTub('myBusinessesScreen');
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Icon(Icons.arrow_back_sharp, color: Colors.white),
                ),
              ),
              SizedBox(width: 20),
              Text(
                business.title,
                style: TextStyle(
                    color: Colors.white, fontSize: 19, fontFamily: 'Gilroy'),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ));
  }
}
