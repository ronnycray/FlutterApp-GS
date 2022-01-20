import 'package:GainSystemsApp/graphql/business/mutation/addTeamMemberMutation.dart';
import 'package:GainSystemsApp/redux/app_state.dart';
import 'package:GainSystemsApp/schemas/roleNode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AddTeamMemberBusinessScreen extends StatefulWidget {
  AddTeamMemberBusinessScreen({Key? key, required this.updateCurrentTub})
      : super(key: key);

  final Function updateCurrentTub;

  @override
  _AddTeamMemberBusinessScreenState createState() =>
      _AddTeamMemberBusinessScreenState();
}

class _AddTeamMemberBusinessScreenState
    extends State<AddTeamMemberBusinessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _HeaderAddTeamMemberWidget(updateCurrentTub: widget.updateCurrentTub),
          _ContentInputInformationNewMemberWidget(
              updateCurrentTub: widget.updateCurrentTub)
        ],
      )),
    );
  }
}

class _ContentInputInformationNewMemberWidget extends StatefulWidget {
  const _ContentInputInformationNewMemberWidget({
    Key? key,
    required this.updateCurrentTub,
  }) : super(key: key);

  final Function updateCurrentTub;

  @override
  State<_ContentInputInformationNewMemberWidget> createState() =>
      _ContentInputInformationNewMemberWidgetState();
}

class _ContentInputInformationNewMemberWidgetState
    extends State<_ContentInputInformationNewMemberWidget> {
  final emailMemberTextController = TextEditingController();
  final descriptionMemberTextController = TextEditingController();

  String? emailTeamMemberError = null;
  String? descriptionTeamMemberError = null;
  String? roleMemberTeamError = null;

  var dateFromController = TextEditingController(text: "Установить дату");
  var dateToController = TextEditingController(text: "Установить дату");

  Role defaultValue =
      Role(id: 0, name: 'Нет роли', description: 'У вас нет ролей в бизнесе');

  TextStyle _errorStyleText() =>
      TextStyle(color: Colors.red, fontSize: 16, fontFamily: 'Gilroy');

  var colorText = Color.fromRGBO(110, 110, 110, 1);

  InputDecoration getInputDecoration(String? errorText) {
    return InputDecoration(
        enabled: true,
        errorText: errorText,
        errorStyle: _errorStyleText(),
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: Color.fromRGBO(229, 228, 228, 1), width: 2)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color.fromRGBO(229, 228, 228, 1),
              width: 2,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color.fromRGBO(229, 228, 228, 1),
              width: 2,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: Color.fromRGBO(229, 228, 228, 1), width: 2)));
  }

  var boxSelectionDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(color: Color.fromRGBO(229, 228, 228, 1), width: 0.80),
  );

  @override
  Widget build(BuildContext context) {
    TextStyle _titleInputTextStyle() {
      return TextStyle(fontSize: 15, color: Color.fromRGBO(70, 70, 70, 1));
    }

    void pickDate(BuildContext context, String typeDate) async {
      print('PICKER');
      DateTime lastDate = typeDate == 'from'
          ? DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day)
          : DateTime(2050);
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1980),
          lastDate: lastDate);
      if (picked != null) {
        if (picked.toString() != dateFromController.text && typeDate == 'from')
          setState(() {
            dateFromController = TextEditingController(
                text: "${picked.day}.${picked.month}.${picked.year}");
          });
        else if (picked.toString() != dateToController.text && typeDate == 'to')
          setState(() {
            dateToController = TextEditingController(
                text: "${picked.day}.${picked.month}.${picked.year}");
          });
      }
    }

    void changeSelectRoleMember(Role roleName) {
      print("newValue ${roleName}");
      setState(() {
        defaultValue = roleName;
      });
    }

    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email нового члена команды',
                  style: _titleInputTextStyle(),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: emailTeamMemberError == null ? 40 : 60,
                  child: TextField(
                      controller: emailMemberTextController,
                      decoration: getInputDecoration(emailTeamMemberError)),
                )
              ],
            )),
            SizedBox(height: 30),
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Описание члена команды',
                  style: _titleInputTextStyle(),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLength: 2000,
                      maxLines: null,
                      controller: descriptionMemberTextController,
                      decoration:
                          getInputDecoration(descriptionTeamMemberError)),
                )
              ],
            )),
            SizedBox(height: 30),
            Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text('Роль члена команды',
                      style: TextStyle(fontSize: 13, color: colorText)),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: boxSelectionDecoration,
                    height: 39,
                    child: DropdownButtonHideUnderline(
                      child: StoreConnector<AppState, AppState>(
                        converter: (store) => store.state,
                        builder: (context, vm) => DropdownButton<Role>(
                            value: (!vm.business!.roles.isEmpty)
                                ? vm.business!.roles[0]
                                : defaultValue,
                            isExpanded: false,
                            onChanged: (Role) => changeSelectRoleMember,
                            items: vm.business!.roles.isEmpty
                                ? vm.business!.roles
                                    .map<DropdownMenuItem<Role>>((Role role) {
                                    return DropdownMenuItem<Role>(
                                      value: role,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(role.name),
                                      ),
                                    );
                                  }).toList()
                                : [defaultValue]
                                    .map<DropdownMenuItem<Role>>((Role role) {
                                    return DropdownMenuItem<Role>(
                                      value: role,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(role.name),
                                      ),
                                    );
                                  }).toList()),
                      ),
                    ),
                  ),
                ])),
            SizedBox(height: 30),
            Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text('Добавить члена команды начиная c даты',
                      style: TextStyle(
                          fontSize: 13, color: Color.fromRGBO(70, 70, 70, 1))),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: dateFromController,
                      decoration: getInputDecoration(null),
                      onTap: () => pickDate(context, 'from'),
                    ),
                  )
                ])),
            SizedBox(height: 30),
            Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text('Удалить члена команды',
                      style: TextStyle(
                          fontSize: 13, color: Color.fromRGBO(70, 70, 70, 1))),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: dateToController,
                      decoration: getInputDecoration(null),
                      onTap: () => pickDate(context, 'to'),
                    ),
                  )
                ])),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Mutation(
                  options: MutationOptions(
                      document: gql(addTeamMemberMutation),
                      // or do something with the result.data on completion
                      onCompleted: (dynamic resultData) => {
                            if (resultData != null)
                              {
                                print('resultData ${resultData}'),
                                setState(() {
                                  widget.updateCurrentTub('myBusinessesScreen');
                                })
                              }
                          }),
                  builder: (
                    RunMutation runMutation,
                    QueryResult? result,
                  ) =>
                      ElevatedButton(
                          onPressed: () => {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, bottom: 15, top: 15),
                            child: Text(
                              'Добавить бизнесс',
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
            )
          ],
        ),
      ),
    );
  }
}

class _HeaderAddTeamMemberWidget extends StatefulWidget {
  const _HeaderAddTeamMemberWidget({
    Key? key,
    required this.updateCurrentTub,
  }) : super(key: key);

  final Function updateCurrentTub;

  @override
  State<_HeaderAddTeamMemberWidget> createState() =>
      _HeaderAddTeamMemberWidgetState();
}

class _HeaderAddTeamMemberWidgetState
    extends State<_HeaderAddTeamMemberWidget> {
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
                  widget.updateCurrentTub('myTeamMembersScreen');
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Icon(Icons.arrow_back_sharp, color: Colors.white),
                ),
              ),
              SizedBox(width: 20),
              Text(
                'Добавление нового члена команды',
                style: TextStyle(
                    color: Colors.white, fontSize: 15, fontFamily: 'Gilroy'),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ));
  }
}
