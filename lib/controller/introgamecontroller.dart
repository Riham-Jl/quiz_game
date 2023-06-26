import 'package:get/get.dart';
import 'package:haddithny/controller/choosingcontroller.dart';
import 'package:haddithny/data/introgames.dart';

import '../core/constant/audioasset.dart';
import '../core/functions/playsound.dart';


class IntroGameController extends GetxController{

  
  int? i;
  int? step;

  startgame(){
      stopBackSound();

    playsound(AppAudioAsset.startgame);
    Get.offNamed(introgames[i!] , arguments: {"game" : i , "step" : step});
  }

  @override
  void onInit() {
    i= Get.arguments['game'];
    step = Get.arguments['step'];


     super.onInit();
  }


}