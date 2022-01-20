import 'package:GainSystemsApp/redux/actions.dart';
import 'package:GainSystemsApp/redux/app_state.dart';
import 'package:GainSystemsApp/schemas/businessNode.dart';
import 'package:GainSystemsApp/schemas/teamNode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/src/store.dart' as redux;

class BusinessDirectionWidget extends StatefulWidget {
  BusinessDirectionWidget(
      {Key? key,
      required this.updateCurrentTub,
      required this.updateSettingsBusinessScreenWidget})
      : super(key: key);

  final Function updateCurrentTub;
  final Function updateSettingsBusinessScreenWidget;

  @override
  _BusinessDirectionWidgetState createState() =>
      _BusinessDirectionWidgetState();
}

class _BusinessDirectionWidgetState extends State<BusinessDirectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          _HeaderMyBusiness(updateCurrentTub: widget.updateCurrentTub),
          _ButtonAddBusiness(updateCurrentTub: widget.updateCurrentTub),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, vm) => (!vm.user.businesses.isEmpty)
                  ? _ListBusinessesWidget(
                      widget: widget, businesses: vm.user.businesses)
                  : Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                          'У вас нет бизнесов! Нажмите на кнопку "Добавить"!',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center),
                    ),
            ),
          ),
        ],
      )),
    );
  }
}

class _ListBusinessesWidget extends StatelessWidget {
  const _ListBusinessesWidget(
      {Key? key, required this.widget, required this.businesses})
      : super(key: key);

  final BusinessDirectionWidget widget;
  final List<Business>? businesses;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    var listBusinesses = <_BusinessUserWidget>[];
    for (var bis in businesses!) {
      listBusinesses.add(_BusinessUserWidget(
        business: bis,
        nameBusiness: bis.title,
        directionBusiness: bis.description.toString(),
        updateSettingsBusinessScreenWidget:
            widget.updateSettingsBusinessScreenWidget,
        updateCurrentTub: widget.updateCurrentTub,
        teamMembersBusness: [],
      ));
    }
    return Column(
      children: listBusinesses,
    );
  }
}

class _ButtonAddBusiness extends StatefulWidget {
  const _ButtonAddBusiness({
    Key? key,
    required this.updateCurrentTub,
  }) : super(key: key);

  final Function updateCurrentTub;

  @override
  State<_ButtonAddBusiness> createState() => _ButtonAddBusinessState();
}

class _ButtonAddBusinessState extends State<_ButtonAddBusiness> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              widget.updateCurrentTub('createBusinessScreen');
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

class _BusinessUserWidget extends StatefulWidget {
  _BusinessUserWidget(
      {Key? key,
      required this.nameBusiness,
      required this.directionBusiness,
      required this.updateSettingsBusinessScreenWidget,
      required this.updateCurrentTub,
      required this.business,
      required this.teamMembersBusness})
      : super(key: key);

  final String nameBusiness;
  final String directionBusiness;
  final Business business;
  final Function updateSettingsBusinessScreenWidget;
  final Function updateCurrentTub;
  final List<Team> teamMembersBusness;

  @override
  State<_BusinessUserWidget> createState() => _BusinessUserWidgetState();
}

class _BusinessUserWidgetState extends State<_BusinessUserWidget> {
  @override
  Widget build(BuildContext context) {
    final redux.Store<AppState> store = StoreProvider.of<AppState>(context);

    return GestureDetector(
      onTap: () {
        setState(() {
          store.dispatch(UpdateCurrentBusiness(
              currentBusinessID: widget.business.id,
              business: widget.business));
          widget.updateCurrentTub('settingsBusinessScreen');
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 40, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(70, 59, 82, 1),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Text(widget.nameBusiness[0].toUpperCase(),
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      )),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.nameBusiness,
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                      Text(widget.directionBusiness,
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

class _HeaderMyBusiness extends StatefulWidget {
  const _HeaderMyBusiness({
    Key? key,
    required this.updateCurrentTub,
  }) : super(key: key);

  final Function updateCurrentTub;

  @override
  State<_HeaderMyBusiness> createState() => _HeaderMyBusinessState();
}

class _HeaderMyBusinessState extends State<_HeaderMyBusiness> {
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
                'Мои бизнесы',
                style: TextStyle(
                    color: Colors.white, fontSize: 19, fontFamily: 'Gilroy'),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ));
  }
}
