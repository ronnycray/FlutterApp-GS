import 'package:flutter/material.dart';

class CategoriesScreenWidget extends StatefulWidget {
  CategoriesScreenWidget({Key? key, required this.updateCurrentTub})
      : super(key: key);

  final Function updateCurrentTub;

  @override
  _CategoriesScreenWidgetState createState() => _CategoriesScreenWidgetState();
}

class _CategoriesScreenWidgetState extends State<CategoriesScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
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
                        widget.updateCurrentTub(4);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child:
                            Icon(Icons.arrow_back_sharp, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Категории',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontFamily: 'Gilroy'),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
