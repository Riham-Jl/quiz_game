import 'package:flutter/material.dart';
import 'package:haddithny/core/constant/color.dart';

class DraggableContainer extends StatelessWidget {
  final String text;
  const DraggableContainer({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
       decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: AppColor.white

      ),
      width: 120,
      height: 50,
      child: Text(text ,  style: const TextStyle(fontSize: 14 , color: Colors.black), ),
       );
  }
}