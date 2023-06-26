import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/core/constant/color.dart';
import 'package:haddithny/core/constant/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constant/audioasset.dart';
import '../core/functions/playsound.dart';
import '../data/sql.dart';

class SignUpController extends GetxController{
    List persons = [
    {"index" : "1" , "image": "person1.png" },
    {"index" : "2" , "image": "person2.png" },
    {"index" : "3" , "image": "person3.png" },
    {"index" : "4" , "image": "person4.png" },
    {"index" : "5" , "image": "person5.png" },
    {"index" : "6" , "image": "person6.png" },
    
  ];

  SqlDb sqldb = SqlDb();
  late TextEditingController name ;
  String? choosedimage;

  SharedPreferences? sharedpref;


  addUser() async{
         sharedpref = await SharedPreferences.getInstance();

   if (name.text!="" && name.text!="" && choosedimage!=null){ 
    List checkuser = await sqldb.readData("SELECT 'id' FROM users WHERE username= '${name.text}'");
     if(checkuser.isEmpty){
     int response =await sqldb.insertData('''
           INSERT INTO "users" ("username" , "userimage")
                      VALUES ("${name.text}" , "$choosedimage")
                      ''');

                if (response>0){
                  var responsetwo = await sqldb.readData("SELECT id FROM users WHERE username = '${name.text}' AND userimage =  '$choosedimage'");
                  // int id = int.parse(responsetwo[0]);
                   sharedpref!.setInt("id", responsetwo[0]['id']);
                   playsound(AppAudioAsset.home);
                  Get.offAllNamed(AppRoute.home);
                }
     }
     else{
      playsound(AppAudioAsset.warning);
              Get.defaultDialog(
                title: "عذراً",
                middleText: "الحساب موجود سابقاً، الرجاء تسجيل الدخول",
                actions: [
                  ElevatedButton(
                    onPressed: (){
                  Get.offNamed(AppRoute.signin);
                    }, 
                    child: const Text("الذهاب لتسجيل الدخول"))
                ],
                
              );
              }
              }
              else {
                Get.rawSnackbar(
                  backgroundColor: AppColor.lightTeal,
                   messageText: const Text("الرجاء إدخال الاسم واختيار الصورة" , textAlign: TextAlign.right,style: TextStyle(fontSize: 16 ,)));
              }
              
  }




  chooseimage(image){
   choosedimage = image;  
  update();
  playsound(AppAudioAsset.choose);
  }

  back() async{
    Get.offAllNamed(AppRoute.welcome);
    playsound(AppAudioAsset.warning);
  }


  @override
  void onInit() {
    name = TextEditingController();
    super.onInit();
  }
}