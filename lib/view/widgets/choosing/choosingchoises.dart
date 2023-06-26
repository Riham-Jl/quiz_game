import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/choosingcontroller.dart';
import '../../../core/constant/color.dart';


class ChoosingChoises extends GetView<ChoosingController> {
  final int i;
  const ChoosingChoises( {
    Key? key, required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: (){
       controller.chooseanswer(controller.choises()[i]);
     },
      child: Container(
       width: double.infinity,
       padding: const EdgeInsets.all(10),
       margin: const EdgeInsets.symmetric(vertical: 15),
       alignment: Alignment.center,
       decoration: BoxDecoration(
         color: controller.choises()[i]==controller.redanswer?
          AppColor.orange
          :controller.choises()[i]==controller.greenanswer?
          Colors.green[400]
          : AppColor.white,
         borderRadius: const BorderRadius.all(Radius.circular(15)),
         border: controller.choosedanswer==controller.choises()[i]? 
          Border.all(width: 2.5 , color:AppColor.purple): null,
       ),
        child:  Text(controller.choises()[i]),
         
      ),
    );
  }
}