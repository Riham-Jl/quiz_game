import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class AnsweringButton extends StatelessWidget {
  final controller;
  const AnsweringButton({
    Key? key, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.only(bottom: 30 , right: Get.width/3 , left: Get.width/3),
    width: 200,
     child: ElevatedButton(
      style: ButtonStyle(backgroundColor:controller.ans
      ? MaterialStateProperty.all(AppColor.teal)
      :MaterialStateProperty.all(Colors.grey[400]) ),
      onPressed: (){
        controller.ans?
      controller.answeringfunction(): null;
                 },
     child: const Text("تحققي" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),)),
               );
  }
}