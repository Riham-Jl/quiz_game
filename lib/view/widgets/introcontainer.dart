import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class IntroContainer extends StatelessWidget {
  final String title;
  final String descreption;
  final Color? color;
  final void Function()? onpressed;
  
  const IntroContainer({
    Key? key, required this.title, required this.descreption, this.onpressed, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
     color: Colors.white,
     borderRadius: BorderRadius.circular(12),
     border: Border.all(color: AppColor.gray1.withOpacity(0.3) , width: 1.5)
     ),
     margin: const EdgeInsets.all(35),
     padding: const EdgeInsets.all(15),
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                  Text(title , 
                 style:  TextStyle( color: color , fontWeight: FontWeight.bold, fontSize: 30),),
                  Padding(
                   padding: const EdgeInsets.only(top: 5 , bottom: 40),
                   child: Text(descreption ,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColor.gray1 ,  fontSize: 18)),
                 ),
                 ElevatedButton(
                  style: ButtonStyle(backgroundColor:MaterialStateProperty.all(color)),
                   onPressed: onpressed,
                    child: const Text("ابدئي اللعب" , style: TextStyle(fontWeight: FontWeight.bold , color: AppColor.white),))
               ],
             ),
            );
  }
}