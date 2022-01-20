import 'package:flutter/material.dart';

class FinanceScreenWidget extends StatefulWidget {
  FinanceScreenWidget({Key? key}) : super(key: key);

  @override
  _FinanceScreenWidgetState createState() => _FinanceScreenWidgetState();
}

class _FinanceScreenWidgetState extends State<FinanceScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Text('Finance'),
        ),
      ),
    );
  }
}
