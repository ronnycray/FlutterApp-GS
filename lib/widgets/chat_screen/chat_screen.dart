import 'package:flutter/material.dart';

class ChatScreenWidget extends StatefulWidget {
  ChatScreenWidget({Key? key}) : super(key: key);

  @override
  _ChatScreenWidgetState createState() => _ChatScreenWidgetState();
}

class _ChatScreenWidgetState extends State<ChatScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Text('Chat'),
        ),
      ),
    );
  }
}
