import 'package:flutter/material.dart';

class CalendarScreenWidget extends StatefulWidget {
  CalendarScreenWidget({Key? key}) : super(key: key);

  @override
  _CalendarScreenWidgetState createState() => _CalendarScreenWidgetState();
}

class _CalendarScreenWidgetState extends State<CalendarScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Text('Calendar'),
        ),
      ),
    );
  }
}
