import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstLaunchScreenWidget extends StatelessWidget {
  const FirstLaunchScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(70, 59, 82, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(children: const [
            _CardWelcomImageWidget(),
            SizedBox(height: 30),
            _DescriptionWelcomeWidget()
          ]),
        ),
      ),
    );
  }
}

class _CardWelcomImageWidget extends StatelessWidget {
  const _CardWelcomImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var first_launch_image2 = "assets/images/first_launch_image.svg";
    return Padding(
      padding: const EdgeInsets.only(top: 174, left: 46, right: 68),
      child: SvgPicture.asset(first_launch_image2),
    );
  }
}

class _DescriptionWelcomeWidget extends StatelessWidget {
  const _DescriptionWelcomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          _TextGainSystemWelcomWidget(),
          SizedBox(height: 14),
          _TextDescriptionWelcomeWidget(),
          SizedBox(height: 140),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: _ButtonGetStartedWidget(),
          )
        ]);
  }
}

class _ButtonGetStartedWidget extends StatefulWidget {
  const _ButtonGetStartedWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_ButtonGetStartedWidget> createState() =>
      _ButtonGetStartedWidgetState();
}

class _ButtonGetStartedWidgetState extends State<_ButtonGetStartedWidget> {
  ButtonStyle _buttonStyleWidget() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      backgroundColor:
          MaterialStateProperty.all(const Color.fromRGBO(56, 255, 139, 0.7)),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: _buttonStyleWidget(),
      child: const _TextButtonGetStartedWidget(),
      onPressed: _pushButtonGetStarted,
    );
  }

  void _pushButtonGetStarted() {
    Navigator.of(context).pushReplacementNamed('/enterLaunch');
  }
}

class _TextButtonGetStartedWidget extends StatelessWidget {
  const _TextButtonGetStartedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 78, right: 78, top: 15, bottom: 15),
      child: const Text('Начать',
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal),
          textAlign: TextAlign.center),
    );
  }
}

class _TextDescriptionWelcomeWidget extends StatelessWidget {
  const _TextDescriptionWelcomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 55, right: 55),
      child: const Center(
        child: Text(
            'Лучший способ сохранить ваши финансы в рабочем состоянии без осложнений',
            style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal),
            textAlign: TextAlign.center),
      ),
    );
  }
}

class _TextGainSystemWelcomWidget extends StatelessWidget {
  const _TextGainSystemWelcomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Gain Systems',
        style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            fontFamily: 'Gilroy'));
  }
}
