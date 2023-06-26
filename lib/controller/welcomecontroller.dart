import 'package:get/get.dart';
import 'package:haddithny/core/constant/audioasset.dart';
import 'package:haddithny/core/constant/routes.dart';
import 'package:haddithny/core/functions/playsound.dart';

class WelcomeController extends GetxController{

  signin(){
    playsound(AppAudioAsset.buttons);
    Get.toNamed(AppRoute.signin);

  }


  signup(){
    playsound(AppAudioAsset.buttons);
    Get.toNamed(AppRoute.signup);
  }



}