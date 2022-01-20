import 'package:flutter/material.dart';

class MainSettingsSelectionBusiness extends StatefulWidget {
  MainSettingsSelectionBusiness(
      {Key? key,
      required this.updateCurrentTub,
      required this.nameBusiness,
      required this.directionBusiness})
      : super(key: key);

  final Function updateCurrentTub;
  final String nameBusiness;
  final String directionBusiness;

  @override
  _MainSettingsSelectionBusinessState createState() =>
      _MainSettingsSelectionBusinessState();
}

class _MainSettingsSelectionBusinessState
    extends State<MainSettingsSelectionBusiness> {
  void updateScreen(String namePage) {
    print('UPDATEEE ${namePage}');
    widget.updateCurrentTub(namePage);
  }

  final _outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(229, 228, 228, 1),
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)));
  var listTeamMembersItems = [
    {1: 'Выбрать людей'},
    {2: 'Иванов Иванов'},
    {3: 'Галина Сергеевна'},
    {4: 'Пуговка'},
  ];
  Map<int, String> selectedTeamMembersItems = {};
  var boxSelectionDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(color: Color.fromRGBO(229, 228, 228, 1), width: 0.80),
  );
  void addTeamMember(String member) {
    print('fdsfd');
  }

  @override
  Widget build(BuildContext context) {
    final nameRoleBusiness = TextEditingController(text: widget.nameBusiness);
    final statusRole = TextEditingController(text: '');
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        _HeaderAddNewRoleBusinessWidget(widget: widget),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text('Введите название',
                          style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(70, 70, 70, 1))),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 39,
                        child: TextField(
                            controller: nameRoleBusiness,
                            enabled: true,
                            decoration: InputDecoration(
                                focusedBorder: _outlineInputBorder,
                                enabledBorder: _outlineInputBorder,
                                hintText: '')),
                      )
                    ])),
                SizedBox(height: 20),
                Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text('Введите статус',
                          style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(70, 70, 70, 1))),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 39,
                        child: TextField(
                            controller: statusRole,
                            enabled: true,
                            decoration: InputDecoration(
                                focusedBorder: _outlineInputBorder,
                                enabledBorder: _outlineInputBorder,
                                hintText: '')),
                      )
                    ])),
                SizedBox(height: 20),
                Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text('Номер телефона',
                          style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(70, 70, 70, 1))),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 39,
                        child: TextField(
                            controller: nameRoleBusiness,
                            enabled: true,
                            decoration: InputDecoration(
                                focusedBorder: _outlineInputBorder,
                                enabledBorder: _outlineInputBorder,
                                hintText: '')),
                      )
                    ])),
                SizedBox(height: 20),
                // Container(
                //   width: double.infinity,
                //   decoration: boxSelectionDecoration,
                //   child: DropdownButtonHideUnderline(
                //     child: DropdownButton(
                //         value: listTeamMembersItems,
                //         isExpanded: false,
                //         // onChanged: addTeamMember,
                //         items: listTeamMembersItems
                //             .map<DropdownMenuItem<String>>(
                //                 (Map<int, String> element) {
                //           print('element ${element}');
                //           return DropdownMenuItem<String>(
                //             value: element[1],
                //             child: Padding(
                //               padding: const EdgeInsets.only(left: 10),
                //               child: Text(element[0]!),
                //             ),
                //           );
                //         }).toList()),
                //   ),
                // )
              ],
            ),
          ),
        )
      ])),
    );
  }
}

class _HeaderAddNewRoleBusinessWidget extends StatelessWidget {
  const _HeaderAddNewRoleBusinessWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MainSettingsSelectionBusiness widget;

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
                'Добавление роли',
                style: TextStyle(
                    color: Colors.white, fontSize: 19, fontFamily: 'Gilroy'),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ));
  }
}
