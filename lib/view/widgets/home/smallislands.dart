import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/controller/homecontroller.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class SmallIslands extends GetView<HomeController> {
  final bool left;
  final bool light;
  final List steps;
  final int step;
  const SmallIslands( {
    Key? key, required this.step, required this.left, required this.steps, required this.light, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      left? Container(): Expanded(child: Container()),

     ...List.generate(4, (i) {
        return Expanded(
          child: Opacity(
            opacity: light?0.3: 1,
            child: InkWell(
              onTap: (){light? null : controller.startgame(step,i);},
              child: Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.all(5),
                height: 65,
                decoration: BoxDecoration(
                 image: DecorationImage (image: 
                 steps[i]==-1? const AssetImage(AppImageAsset.smallIslandLocked)
                 :const AssetImage(AppImageAsset.smallIsland) )),
                child: steps[i]<0? const Text(""): Text("${steps[i]} " , style: const TextStyle(color: AppColor.pink , fontSize: 18 , fontWeight: FontWeight.bold),)),
            ),
          ),
        );
      }),
            left? Expanded(child: Container()): Container(),

    ],
              );
  }
}