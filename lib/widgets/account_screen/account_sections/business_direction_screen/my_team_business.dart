import 'package:GainSystemsApp/redux/app_state.dart';
import 'package:GainSystemsApp/schemas/teamNode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MyTeamBusinessScreenWidget extends StatefulWidget {
  MyTeamBusinessScreenWidget({Key? key, required this.updateCurrentTub})
      : super(key: key);

  final Function updateCurrentTub;

  @override
  _MyTeamBusinessScreenWidgetState createState() =>
      _MyTeamBusinessScreenWidgetState();
}

class _MyTeamBusinessScreenWidgetState
    extends State<MyTeamBusinessScreenWidget> {
  final searchTextTeamMemberController = TextEditingController();
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
        _HeaderTeamMemebrsBusinessWidget(widget: widget),
        _ButtonAddTeamMemberBusinessWidget(widget: widget),
        _SearchFieldTeamMemberWidget(
            searchTextTeamMemberController: searchTextTeamMemberController,
            outlineInputBorder: _outlineInputBorder),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, vm) => Container(
              width: double.infinity,
              child: (vm.business != null && !vm.business!.teams.isEmpty)
                  ? _ListTeamMembersWidget(
                      updateCurrentTub: widget.updateCurrentTub,
                      businessTeamMember: vm.business!.teams,
                    )
                  : Text(
                      'У Вас нет членов команды бизнесса. Что бы добавить нового члена команды, надмите "Добавить"!',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center),
            ),
          ),
        )
      ])),
    );
  }
}

class _ListTeamMembersWidget extends StatefulWidget {
  const _ListTeamMembersWidget({
    Key? key,
    required this.businessTeamMember,
    required this.updateCurrentTub,
  }) : super(key: key);

  final List<Team> businessTeamMember;
  final Function updateCurrentTub;

  @override
  State<_ListTeamMembersWidget> createState() => _ListTeamMembersWidgetState();
}

class _ListTeamMembersWidgetState extends State<_ListTeamMembersWidget> {
  List<_SectionTeamMemberItem> teams = [];

  @override
  Widget build(BuildContext context) {
    for (var member in widget.businessTeamMember) {
      teams.add(_SectionTeamMemberItem(
        updateCurrentTub: widget.updateCurrentTub,
        memberTeam: member,
      ));
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: teams);
  }
}

class _SectionTeamMemberItem extends StatefulWidget {
  const _SectionTeamMemberItem({
    Key? key,
    required this.updateCurrentTub,
    required this.memberTeam,
  }) : super(key: key);

  final Function updateCurrentTub;
  final Team memberTeam;

  @override
  State<_SectionTeamMemberItem> createState() => _SectionTeamMemberItemState();
}

class _SectionTeamMemberItemState extends State<_SectionTeamMemberItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      child:
                          Image.asset(widget.memberTeam.member.profilePicture)),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.memberTeam.member.firstName,
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                      Text(widget.memberTeam.role.name,
                          style: TextStyle(fontSize: 13, color: Colors.grey))
                    ],
                  )
                ],
              ),
            ),
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
    );
  }
}

class _SearchFieldTeamMemberWidget extends StatelessWidget {
  const _SearchFieldTeamMemberWidget({
    Key? key,
    required this.searchTextTeamMemberController,
    required OutlineInputBorder outlineInputBorder,
  })  : _outlineInputBorder = outlineInputBorder,
        super(key: key);

  final TextEditingController searchTextTeamMemberController;
  final OutlineInputBorder _outlineInputBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: TextField(
            controller: searchTextTeamMemberController,
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

class _ButtonAddTeamMemberBusinessWidget extends StatelessWidget {
  const _ButtonAddTeamMemberBusinessWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MyTeamBusinessScreenWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              widget.updateCurrentTub('addTeamMemberBusiness');
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

class _HeaderTeamMemebrsBusinessWidget extends StatelessWidget {
  const _HeaderTeamMemebrsBusinessWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MyTeamBusinessScreenWidget widget;

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
                'Команда бизнеса',
                style: TextStyle(
                    color: Colors.white, fontSize: 19, fontFamily: 'Gilroy'),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ));
  }
}
