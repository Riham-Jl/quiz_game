import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/view/widgets/welcome/welcomebuttons.dart';

import '../../../controller/welcomecontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class WelcomeContainer extends GetView<WelcomeController> {
  const WelcomeContainer({
    Key? key,
   
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 320,
        height: 350,
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
         ),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AppImageAsset.appName),
           WelcomeButtons( buttoncolor: AppColor.teal, textcolor: AppColor.white, text: "حساب قديم", onpressed: (){controller.signin();},),
           WelcomeButtons(buttoncolor: AppColor.white, textcolor: AppColor.teal, text: "إنشاء حساب جديد" , onpressed: (){controller.signup();},)
          ],
         ),
      
    );
  }
}