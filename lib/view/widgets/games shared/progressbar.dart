import 'package:flutter/material.dart';
import 'package:haddithny/core/functions/stars.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class ProgressBar extends StatelessWidget {
  final controller;

  const ProgressBar({
    Key? key, this.controller, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
      return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
         clipBehavior: Clip.none,
          children:[
            LinearPercentIndicator(
             padding: const EdgeInsets.only(top:15 , right: 15),
               animateFromLastPercent: true,
               isRTL: true,
               barRadius: const Radius.circular(15),
               backgroundColor: AppColor.white,
               width: 300.0,
               animation: true,
               animationDuration: 1000,
               lineHeight: 35.0,
               percent: controller.finalcorrectanswers/10,
               progressColor: AppColor.lightPurple,
                      ),
             Positioned(
               right: -15,
               child: Container(
                 alignment: Alignment.center,
                 width: 45,
                 height: 45,
                 decoration: const BoxDecoration(
                   image: DecorationImage(image: AssetImage(AppImageAsset.star) , fit: BoxFit.fill) ),
                 child: Text(stars(controller.finalcorrectanswers) , style: const TextStyle(fontSize: 23),),
                  ),
               )
          ]            
        ),
      ],
    );
  }
}

