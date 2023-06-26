import 'package:flutter/material.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100, bottom: 50),
      child: const Text("مرحباً بك", style: TextStyle(color: Color.fromRGBO(89, 80, 161, 1) , fontSize: 45 , fontWeight: FontWeight.bold),));
  }
}