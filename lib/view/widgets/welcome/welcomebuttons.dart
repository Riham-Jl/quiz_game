import 'package:flutter/material.dart';
import 'package:haddithny/core/constant/color.dart';

class WelcomeButtons extends StatelessWidget {
  final Color buttoncolor;
  final Color textcolor;
  final String text;
  final void Function()? onpressed; 
  const WelcomeButtons({super.key,  required this.buttoncolor, required this.textcolor, required this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(buttoncolor),
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side:  const BorderSide(color: AppColor.teal , width: 3)
          )
  )),
        onPressed: onpressed,
       child:  Text(text , style: TextStyle(color: textcolor, fontWeight: FontWeight.bold),),
      ),
    );
  }
}