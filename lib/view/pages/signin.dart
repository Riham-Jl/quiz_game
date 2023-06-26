import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/core/constant/color.dart';
import 'package:haddithny/core/constant/imageasset.dart';
import '../../controller/signincontroller.dart';
import '../widgets/sign/appbar.dart';
import '../widgets/sign/signinpersons.dart';
import '../widgets/sign/buttons.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    SignInController controller = Get.put(SignInController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColor.bluewhite,
        body: WillPopScope(
        onWillPop: (){
          controller.back();
        return Future.value(true);
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal:20),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImageAsset.blueBackground) , fit: BoxFit.fill) ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const AppbarSign(textone: "أهلاً بك من جديد ", texttwo: "لطفاً اختاري حسابك لمتابعة التقدم"),
                const SignInPersons(),
                 SignButtons(
                  onpressedbtn1: (){controller.go();},
                  onpressedbtn2: (){controller.back();},
                ),
      
                
              ]) ,
        ),
      ),
    ));
  }
}





