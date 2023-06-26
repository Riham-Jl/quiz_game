import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/controller/signupcontroller.dart';
import 'package:haddithny/core/constant/imageasset.dart';
import '../widgets/sign/appbar.dart';
import '../widgets/sign/signuppersons.dart';
import '../widgets/sign/buttons.dart';
import '../widgets/sign/signupname.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body:WillPopScope(
        onWillPop: (){
          controller.back();
        return Future.value(true);
        },
        child:  Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal:20),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImageAsset.blueBackground) , fit: BoxFit.fill) ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const AppbarSign(textone: "مرحباً بك.. ", texttwo: "لطفاً أدخلي الاسم واختاري الصورة المفضلة"),
                SignUpName(name: controller.name,),
                const SignUpPersons(),
                 SignButtons(
                  onpressedbtn1: () {
                   controller.addUser();
                 },
                 onpressedbtn2: (){
                  controller.back();
                 },),
      
                
              ]) ,
        ),
      ),
    ));
  }
}





