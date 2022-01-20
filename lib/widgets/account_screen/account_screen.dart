import 'package:GainSystemsApp/redux/app_state.dart';
// import 'package:GainSystemsApp/schemas/userNode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
// import 'package:GainSystemsApp/schemas/userNode.dart';

class AccountScreenWidget extends StatefulWidget {
  AccountScreenWidget({Key? key, required this.updateCurrentTub})
      : super(key: key);

  final Function updateCurrentTub;

  @override
  _AccountScreenWidgetState createState() => _AccountScreenWidgetState();
}

class _AccountScreenWidgetState extends State<AccountScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          _HeaderAccountWidget(),
          _SectionsMenuAccount(updateCurrentTub: widget.updateCurrentTub)
        ],
      )),
    );
  }
}

class _SectionsMenuAccount extends StatefulWidget {
  _SectionsMenuAccount({Key? key, required this.updateCurrentTub})
      : super(key: key);

  final Function updateCurrentTub;

  @override
  State<_SectionsMenuAccount> createState() => _SectionsMenuAccountState();
}

class _SectionsMenuAccountState extends State<_SectionsMenuAccount> {
  final boxDecorationSectionAccountMenu = BoxDecoration(
      color: Color.fromRGBO(240, 240, 240, 1),
      borderRadius: BorderRadius.all(Radius.circular(10)));

  @override
  Widget build(BuildContext context) {
    void showModal(String newCurrentScreen) {
      widget.updateCurrentTub(newCurrentScreen);
    }

    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 28, right: 28),
        child: Column(children: [
          _SectionAccountMenu(
              boxDecorationSectionAccountMenu: boxDecorationSectionAccountMenu,
              iconSectionAccountMenu: Icons.person,
              textSectionAccountMenu: 'Мой аккаунт',
              presedFunction: () {
                showModal('myAccountScreen');
              }),
          SizedBox(
            height: 10,
          ),
          _SectionAccountMenu(
              boxDecorationSectionAccountMenu: boxDecorationSectionAccountMenu,
              iconSectionAccountMenu: Icons.business_center_sharp,
              textSectionAccountMenu: 'Мои бизнесы',
              presedFunction: () {
                showModal('myBusinessesScreen');
              }),
          SizedBox(
            height: 10,
          ),
          _SectionAccountMenu(
              boxDecorationSectionAccountMenu: boxDecorationSectionAccountMenu,
              iconSectionAccountMenu: Icons.credit_card,
              textSectionAccountMenu: 'Кошельки',
              presedFunction: () {
                showModal('myWalletsScreen');
              }),
          SizedBox(
            height: 10,
          ),
          _SectionAccountMenu(
              boxDecorationSectionAccountMenu: boxDecorationSectionAccountMenu,
              iconSectionAccountMenu: Icons.list_alt_sharp,
              textSectionAccountMenu: 'Категории',
              presedFunction: () {
                // showModal(8);
              }),
        ]),
      ),
    );
  }
}

class _SectionAccountMenu extends StatefulWidget {
  const _SectionAccountMenu(
      {Key? key,
      required this.boxDecorationSectionAccountMenu,
      required this.iconSectionAccountMenu,
      required this.textSectionAccountMenu,
      required this.presedFunction})
      : super(key: key);

  final BoxDecoration boxDecorationSectionAccountMenu;
  final IconData iconSectionAccountMenu;
  final String textSectionAccountMenu;
  final Function presedFunction;

  @override
  State<_SectionAccountMenu> createState() => _SectionAccountMenuState();
}

class _SectionAccountMenuState extends State<_SectionAccountMenu> {
  @override
  Widget build(BuildContext context) {
    void onTapFunction() {
      widget.presedFunction();
    }

    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        height: 60,
        width: 334,
        decoration: widget.boxDecorationSectionAccountMenu,
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
                    child: Icon(widget.iconSectionAccountMenu),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('${widget.textSectionAccountMenu}'),
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

class _HeaderAccountWidget extends StatefulWidget {
  const _HeaderAccountWidget({Key? key}) : super(key: key);

  @override
  State<_HeaderAccountWidget> createState() => _HeaderAccountWidgetState();
}

class _HeaderAccountWidgetState extends State<_HeaderAccountWidget> {
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
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: StoreConnector<AppState, AppState>(
                  converter: (store) => store.state,
                  builder: (context, vm) => Text(
                    vm.user.firstName.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontFamily: 'Gilroy'),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
