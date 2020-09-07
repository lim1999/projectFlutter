import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterchat/homeScreen.dart';

class SlashScreen extends StatefulWidget {
  SlashScreen({Key key}) : super(key: key);

  @override
  _SlashScreenState createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Image.network(
          'https://i.pinimg.com/originals/dd/fe/43/ddfe435f66b2d65d0a549c60f1aeafa2.jpg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
