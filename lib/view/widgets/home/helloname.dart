import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class HelloName extends StatelessWidget {
  final String name;
  final String image;
  const HelloName({
    Key? key, required this.name, required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      right: -20,
      width: 260,
      height: 80,
      child: Container(
        padding: const EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),  color: AppColor.white.withOpacity(0.8), ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("مرحباً $name    \n بطلة الأربعين نووية " , textAlign: TextAlign.center, style: const TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
             Image.asset("${AppImageAsset.rootimages}/$image" , width: 65, height: 65,),
            ]) ,
       ));
  }
}



