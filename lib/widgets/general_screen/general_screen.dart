import 'package:GainSystemsApp/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_redux/flutter_redux.dart';

class GeneralScreenWidget extends StatefulWidget {
  GeneralScreenWidget({Key? key, required this.updateCurrentTub})
      : super(key: key);

  final Function updateCurrentTub;

  @override
  _GeneralScreenWidgetState createState() => _GeneralScreenWidgetState();
}

class _GeneralScreenWidgetState extends State<GeneralScreenWidget> {
  final searchTextController = TextEditingController();

  final meetingTitle =
      "Встретиться с поставщиками и утвердить что мы можем сделать";

  final _outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(246, 246, 248, 1),
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)));

  final historiesWidgets = [
    SizedBox(
        width: 61,
        height: 61,
        child: Image.asset("assets/images/history1.png")),
    SizedBox(
        width: 61,
        height: 61,
        child: Image.asset("assets/images/history2.png")),
    SizedBox(
        width: 61,
        height: 61,
        child: Image.asset("assets/images/history3.png")),
    SizedBox(
        width: 61,
        height: 61,
        child: Image.asset("assets/images/history4.png")),
    SizedBox(
        width: 61, height: 61, child: Image.asset("assets/images/history5.png"))
  ];

  final meetingParticipants = [
    SizedBox(
        width: 20,
        height: 20,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Image.asset("assets/images/personmeeting1.png"),
        )),
    SizedBox(
        width: 20,
        height: 20,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Image.asset("assets/images/personmeeting2.png"),
        )),
    SizedBox(
        width: 20,
        height: 20,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Image.asset("assets/images/personmeeting3.png"),
        ))
  ];

  final listFanancialReport = [
    Container(
        width: 200,
        decoration: BoxDecoration(color: Colors.blue),
        child: Text(
          'Coming soon',
          style: TextStyle(fontSize: 15.0),
          textAlign: TextAlign.center,
        )),
    Container(
        width: 200,
        decoration: BoxDecoration(color: Colors.blue),
        child: Text(
          'Coming soon',
          style: TextStyle(fontSize: 15.0),
          textAlign: TextAlign.center,
        )),
    Container(
        width: 200,
        decoration: BoxDecoration(color: Colors.blue),
        child: Text(
          'Coming soon',
          style: TextStyle(fontSize: 15.0),
          textAlign: TextAlign.center,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    // final Size sizeWindow = MediaQuery.of(context).size;

    void pushButtonToAccount(String currentScreen) {
      widget.updateCurrentTub(currentScreen);
    }

    double widthSizeIconBottomMenu = 60;
    double heightSizeIconBottomMenu = 60;
    var clientTextStyle =
        TextStyle(fontSize: 11, color: Color.fromRGBO(84, 83, 105, 1));
    final clientsListWidgets = [
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('assets/images/client5.png',
            width: widthSizeIconBottomMenu, height: heightSizeIconBottomMenu),
        Column(
          children: [
            Text('Иванова',
                style: clientTextStyle, textAlign: TextAlign.center),
            Text('Ивана', style: clientTextStyle, textAlign: TextAlign.center),
          ],
        )
      ]),
      Column(children: [
        Image.asset('assets/images/client4.png',
            width: widthSizeIconBottomMenu, height: heightSizeIconBottomMenu),
        Column(
          children: [
            Text('Денис', style: clientTextStyle, textAlign: TextAlign.center),
            Text('Максимов',
                style: clientTextStyle, textAlign: TextAlign.center),
          ],
        )
      ]),
      Column(children: [
        Image.asset('assets/images/client3.png',
            width: widthSizeIconBottomMenu, height: heightSizeIconBottomMenu),
        Column(
          children: [
            Text('Иванова',
                style: clientTextStyle, textAlign: TextAlign.center),
            Text('Ивана', style: clientTextStyle, textAlign: TextAlign.center),
          ],
        )
      ]),
      Column(children: [
        Image.asset('assets/images/client2.png',
            width: widthSizeIconBottomMenu, height: heightSizeIconBottomMenu),
        Column(
          children: [
            Text('Денис', style: clientTextStyle, textAlign: TextAlign.center),
            Text('Максимов',
                style: clientTextStyle, textAlign: TextAlign.center),
          ],
        )
      ]),
      Column(children: [
        Image.asset('assets/images/client1.png',
            width: widthSizeIconBottomMenu, height: heightSizeIconBottomMenu),
        Column(
          children: [
            Text('Иванова',
                style: clientTextStyle, textAlign: TextAlign.center),
            Text('Ивана', style: clientTextStyle, textAlign: TextAlign.center),
          ],
        )
      ])
    ];
    final labelSectionStyle =
        TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 16);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          _HeaderMainScreenWidget(
            updateCurrentTub: pushButtonToAccount,
          ),
          _SearchMainScreenWidget(
              searchTextController: searchTextController,
              outlineInputBorder: _outlineInputBorder),
          _HistoriesMainScreenWidget(historiesWidgets: historiesWidgets),
          _MeetingMainScreenWidget(
              labelSectionStyle: labelSectionStyle,
              meetingTitle: meetingTitle,
              meetingParticipants: meetingParticipants),
          _FinanceMainScreenWidget(listFanancialReport: listFanancialReport),
          _ClientsMainScreenWidget(
              labelSectionStyle: labelSectionStyle,
              clientsListWidgets: clientsListWidgets)
        ]),
      ),
    );
  }
}

class _ClientsMainScreenWidget extends StatefulWidget {
  const _ClientsMainScreenWidget({
    Key? key,
    required this.labelSectionStyle,
    required this.clientsListWidgets,
  }) : super(key: key);

  final TextStyle labelSectionStyle;
  final List<Column> clientsListWidgets;

  @override
  State<_ClientsMainScreenWidget> createState() =>
      _ClientsMainScreenWidgetState();
}

class _ClientsMainScreenWidgetState extends State<_ClientsMainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Клиенты', style: widget.labelSectionStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Подробнее',
                              style: const TextStyle(
                                  color: Color.fromRGBO(68, 168, 110, 1),
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal))
                        ],
                        //   recognizer: ()
                        // ..onTap = _pushButtonRegistration,
                      )),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_right_alt_outlined,
                          color: Color.fromRGBO(68, 168, 110, 1))
                    ],
                  )
                ]),
            SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: widget.clientsListWidgets)
          ],
        ),
      ),
    );
  }
}

class _FinanceMainScreenWidget extends StatefulWidget {
  const _FinanceMainScreenWidget({
    Key? key,
    required this.listFanancialReport,
  }) : super(key: key);

  final List<Container> listFanancialReport;

  @override
  State<_FinanceMainScreenWidget> createState() =>
      _FinanceMainScreenWidgetState();
}

class _FinanceMainScreenWidgetState extends State<_FinanceMainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.only(left: 22, top: 22),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Финансы',
                      style: TextStyle(
                          color: Color.fromRGBO(125, 125, 125, 1),
                          fontSize: 20)),
                  SizedBox(
                    height: 6,
                  ),
                  Text('\$256,204',
                      style: TextStyle(color: Colors.black, fontSize: 26)),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.arrow_drop_up_rounded,
                                size: 15,
                                color: Colors.green,
                              ),
                            ),
                            WidgetSpan(child: SizedBox(width: 3)),
                            TextSpan(
                                text: "10.32%",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.arrow_drop_down_rounded,
                                size: 15,
                                color: Colors.red,
                              ),
                            ),
                            WidgetSpan(child: SizedBox(width: 3)),
                            TextSpan(
                                text: "2.58%",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 22, bottom: 22),
                      child: CarouselSlider(
                          options: CarouselOptions(height: 150),
                          items: widget.listFanancialReport))
                ]),
          )),
    );
  }
}

class _MeetingMainScreenWidget extends StatefulWidget {
  const _MeetingMainScreenWidget(
      {Key? key,
      required this.meetingTitle,
      required this.meetingParticipants,
      required this.labelSectionStyle})
      : super(key: key);

  final String meetingTitle;
  final List<SizedBox> meetingParticipants;
  final TextStyle labelSectionStyle;

  @override
  State<_MeetingMainScreenWidget> createState() =>
      _MeetingMainScreenWidgetState();
}

class _MeetingMainScreenWidgetState extends State<_MeetingMainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
        child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Мои встречи', style: widget.labelSectionStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Подробнее',
                            style: const TextStyle(
                                color: Color.fromRGBO(68, 168, 110, 1),
                                fontSize: 14,
                                fontStyle: FontStyle.normal))
                      ],
                      //   recognizer: ()
                      // ..onTap = _pushButtonRegistration,
                    )),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_right_alt_outlined,
                        color: Color.fromRGBO(68, 168, 110, 1))
                  ],
                )
              ]),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.people_sharp, size: 16),
                            ),
                            WidgetSpan(child: SizedBox(width: 10)),
                            TextSpan(
                                text: "Встреча",
                                style: TextStyle(
                                    color: Color.fromRGBO(125, 125, 125, 1))),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(widget.meetingTitle,
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.left),
                      ),
                      SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.access_time, size: 16),
                                ),
                                WidgetSpan(child: SizedBox(width: 10)),
                                TextSpan(
                                    text: "15:34-17:34",
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(125, 125, 125, 1))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: widget.meetingParticipants),
                          ),
                        ],
                      ),
                      SizedBox(height: 23)
                    ],
                  ),
                )),
          )
        ]),
      ),
    );
  }
}

class _HistoriesMainScreenWidget extends StatefulWidget {
  const _HistoriesMainScreenWidget({
    Key? key,
    required this.historiesWidgets,
  }) : super(key: key);

  final List<SizedBox> historiesWidgets;

  @override
  State<_HistoriesMainScreenWidget> createState() =>
      _HistoriesMainScreenWidgetState();
}

class _HistoriesMainScreenWidgetState
    extends State<_HistoriesMainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.historiesWidgets),
      ),
    );
  }
}

class _SearchMainScreenWidget extends StatefulWidget {
  const _SearchMainScreenWidget({
    Key? key,
    required this.searchTextController,
    required OutlineInputBorder outlineInputBorder,
  })  : _outlineInputBorder = outlineInputBorder,
        super(key: key);

  final TextEditingController searchTextController;
  final OutlineInputBorder _outlineInputBorder;

  @override
  State<_SearchMainScreenWidget> createState() =>
      _SearchMainScreenWidgetState();
}

class _SearchMainScreenWidgetState extends State<_SearchMainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
        child: TextField(
            controller: widget.searchTextController,
            enabled: true,
            decoration: InputDecoration(
                focusedBorder: widget._outlineInputBorder,
                enabledBorder: widget._outlineInputBorder,
                hintText: 'Поиск')),
      ),
    );
  }
}

class _HeaderMainScreenWidget extends StatefulWidget {
  const _HeaderMainScreenWidget({Key? key, required this.updateCurrentTub})
      : super(key: key);

  final Function updateCurrentTub;

  @override
  State<_HeaderMainScreenWidget> createState() =>
      _HeaderMainScreenWidgetState();
}

class _HeaderMainScreenWidgetState extends State<_HeaderMainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        color: Color.fromRGBO(70, 59, 82, 1),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 50),
          child: StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, vm) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    'Главная',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(width: 90),
                Text(
                  'Пекарня',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.right,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Icon(Icons.arrow_drop_down_sharp, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: InkWell(
                    onTap: () {
                      widget.updateCurrentTub('accountScreen');
                    },
                    child: Image.network(
                      vm.user.profilePicture.toString(),
                      width: 35,
                      height: 35,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
