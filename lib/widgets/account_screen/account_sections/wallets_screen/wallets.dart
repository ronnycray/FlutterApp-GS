import 'package:flutter/material.dart';

class WalletsWidget extends StatefulWidget {
  WalletsWidget({Key? key, required this.updateCurrentTub}) : super(key: key);

  final Function updateCurrentTub;

  @override
  _WalletsWidgetState createState() => _WalletsWidgetState();
}

class _WalletsWidgetState extends State<WalletsWidget> {
  // final _outlineInputBorder = OutlineInputBorder(
  //     borderSide: BorderSide(
  //       color: Color.fromRGBO(246, 246, 248, 1),
  //     ),
  //     borderRadius: BorderRadius.all(Radius.circular(10)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          _HeaderMyWalletsWidget(widget: widget),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _MyCardWidget(),
                  _MyCardWidget(),
                  _MyCardWidget(),
                  _MyCardWidget(),
                  _MyCardWidget(),
                  _MyCardWidget()
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class _MyCardWidget extends StatelessWidget {
  const _MyCardWidget({
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
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                  child: Text(
                'myCard',
                style: TextStyle(fontSize: 18),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                  child: Text('20 000, 00 ₽',
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color.fromRGBO(91, 207, 140, 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_upward_outlined,
                                  color: Colors.white, size: 20),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Доходов'),
                              Text('20 000, 00 ₽',
                                  style: TextStyle(
                                      color: Color.fromRGBO(19, 154, 95, 1)))
                            ])
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color.fromRGBO(212, 64, 64, 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_downward_outlined,
                                  color: Colors.white, size: 20),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Расходов'),
                              Text('10 000, 00 ₽',
                                  style: TextStyle(color: Colors.black))
                            ])
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _HeaderMyWalletsWidget extends StatefulWidget {
  const _HeaderMyWalletsWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final WalletsWidget widget;

  @override
  State<_HeaderMyWalletsWidget> createState() => _HeaderMyWalletsWidgetState();
}

class _HeaderMyWalletsWidgetState extends State<_HeaderMyWalletsWidget> {
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
                  widget.widget.updateCurrentTub('accountScreen');
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Icon(Icons.arrow_back_sharp, color: Colors.white),
                ),
              ),
              SizedBox(width: 20),
              Text(
                'Кошельки',
                style: TextStyle(
                    color: Colors.white, fontSize: 19, fontFamily: 'Gilroy'),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ));
  }
}
