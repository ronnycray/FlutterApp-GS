import 'package:flutter/material.dart';

class RoleSettingsBusinessScreenWidget extends StatefulWidget {
  RoleSettingsBusinessScreenWidget({Key? key, required this.updateCurrentTub})
      : super(key: key);

  final Function updateCurrentTub;

  @override
  _RoleSettingsBusinessScreenWidgetState createState() =>
      _RoleSettingsBusinessScreenWidgetState();
}

class _RoleSettingsBusinessScreenWidgetState
    extends State<RoleSettingsBusinessScreenWidget> {
  final searchTextRoleController = TextEditingController();
  final _outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(230, 230, 230, 1),
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      _HeaderRoleSettingsBusiness(widget: widget),
      _ButtonAddRoleBusinessWidget(widget: widget),
      _SearchFieldRoleWidget(
          searchTextRoleController: searchTextRoleController,
          outlineInputBorder: _outlineInputBorder),
      _ListCardsRoleBusiness()
    ])));
  }
}

class _ListCardsRoleBusiness extends StatelessWidget {
  const _ListCardsRoleBusiness({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Container(
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _CardRoleBusinessWidget(),
              _CardRoleBusinessWidget(),
              _CardRoleBusinessWidget(),
              _CardRoleBusinessWidget(),
              _CardRoleBusinessWidget()
            ]),
      ),
    );
  }
}

class _CardRoleBusinessWidget extends StatelessWidget {
  const _CardRoleBusinessWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text('Название роли',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 6),
              Text('подзаголовок статуса'),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Container(
                  child: Row(
                    children: [
                      Text('Доступ:',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(43, 155, 90, 1))),
                      SizedBox(width: 10),
                      Container(
                        child: Stack(
                          children: [
                            Image.asset('assets/images/personmeeting1.png'),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Image.asset(
                                  'assets/images/personmeeting2.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Image.asset(
                                  'assets/images/personmeeting3.png'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchFieldRoleWidget extends StatelessWidget {
  const _SearchFieldRoleWidget({
    Key? key,
    required this.searchTextRoleController,
    required OutlineInputBorder outlineInputBorder,
  })  : _outlineInputBorder = outlineInputBorder,
        super(key: key);

  final TextEditingController searchTextRoleController;
  final OutlineInputBorder _outlineInputBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: TextField(
            controller: searchTextRoleController,
            enabled: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              focusedBorder: _outlineInputBorder,
              enabledBorder: _outlineInputBorder,
              hintText: 'Поиск',
            )),
      ),
    );
  }
}

class _ButtonAddRoleBusinessWidget extends StatelessWidget {
  const _ButtonAddRoleBusinessWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final RoleSettingsBusinessScreenWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              // widget.updateCurrentTub('addTeamMemberBusiness');
            },
            child: Container(
              child: Text('Добавить',
                  style: TextStyle(
                      color: Color.fromRGBO(68, 168, 110, 1), fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderRoleSettingsBusiness extends StatelessWidget {
  const _HeaderRoleSettingsBusiness({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final RoleSettingsBusinessScreenWidget widget;

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
                  widget.updateCurrentTub('settingsBusinessScreen');
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Icon(Icons.arrow_back_sharp, color: Colors.white),
                ),
              ),
              SizedBox(width: 20),
              Text(
                'Настройка ролей',
                style: TextStyle(
                    color: Colors.white, fontSize: 19, fontFamily: 'Gilroy'),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ));
  }
}
