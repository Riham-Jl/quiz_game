import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/core/functions/playsound.dart';

import '../constant/audioasset.dart';
import '../constant/color.dart';
import '../constant/imageasset.dart';

resultmessage(correct){
   playsound(correct?  AppAudioAsset.correct : AppAudioAsset.wrong);
   Get.rawSnackbar(
    duration: const Duration(milliseconds: 1000),
        backgroundColor: AppColor.white.withOpacity(0),
        margin: EdgeInsets.only(bottom: Get.height/3) ,
         messageText: correct? Image.asset(AppImageAsset.correct):  Image.asset(AppImageAsset.wrong)  );
}