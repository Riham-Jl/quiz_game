
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/core/constant/color.dart';
import 'package:haddithny/core/constant/routes.dart';
import 'package:haddithny/core/functions/playsound.dart';

import '../constant/audioasset.dart';



Future<bool> alertExitGame (){
  exitdialog(false);
  return Future.value(true);
}

Future<bool> alertExitAPP (){
  exitdialog(true);
  return Future.value(true);
}


exitdialog(home){
  playsound(AppAudioAsset.warning);
  Get.defaultDialog(
    title: "",
    backgroundColor: Colors.white.withOpacity(0),
    content: Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.all(Radius.circular(20)),
     ),
      width: Get.width-10,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(home?"هل تريدين حقاً الخروج من التطبيق؟": "هل تريدين حقاً الخروج؟ \n لن يتم حفظ التقدم الذي أحرزته في هذه المرحلة مالم تكمليها " ,
            textAlign: TextAlign.center, style: const TextStyle(color: AppColor.teal , fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: home?15:0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColor.white),
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: AppColor.teal)
                            )
  )
),
                  onPressed: (){
                      stopBackSound();
                      stopTimerSound();

                     home? exit(0):  Get.offAllNamed(AppRoute.home);
                  },
                   child: const Text("أريد الخروج" , style: TextStyle(color: AppColor.teal),)),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                            )
  )
),
                  onPressed: (){
                    Get.back();
                  },
                   child: const Text("تراجع")),
              ),
          ],)
        ]),
    )
  );
}