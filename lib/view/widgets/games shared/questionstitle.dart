import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class QuestionTitle extends StatelessWidget {
  final String title;
  const QuestionTitle({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.symmetric(vertical: 20),
     child: Center(
       child: Text( title , 
       style: const TextStyle(color: AppColor.white , fontSize: 26 , fontWeight: FontWeight.bold , height: 1.2),),
     ),
                );
  }
}