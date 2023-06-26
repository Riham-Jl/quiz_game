import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/core/constant/audioasset.dart';
import 'package:haddithny/core/constant/color.dart';
import 'package:haddithny/core/functions/playsound.dart';
import 'package:haddithny/data/matching.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constant/routes.dart';
import '../core/functions/answersmessage.dart';
import '../core/functions/stars.dart';
import '../data/sql.dart';

class MatchingController extends GetxController {

  List<Color> colors = [
    AppColor.teal,
    const Color.fromRGBO(240, 98, 146, 1),
    Colors.blue,
    Colors.yellow,
    Colors.orange
  ];


  SqlDb sqldb = SqlDb();
  SharedPreferences?  sharedpref;
  int? step;
  String si = "";


  List<GlobalKey<FlipCardState>> cardKeys = [];
  List<bool> cardFlips = [];
  List<Map> data = [];
  int previousIndex = -1;
  bool flip = false;
  bool start = true;


  int correctanswers = 0;
  int wrongeanswers= 0;


  bool timer=true;

  
  
  
   timerfinish(){
    timer=false;
    for(int i=0 ; i<data.length ; i++){
              cardKeys[i].currentState!.toggleCard();
          }
          start = false;
          cardFlips=[];
          for (var i = 0; i < data.length; i++) {
      cardFlips.add(true);
      
    }
    update();
   }




  onflip(index) async{
    if(!start){
    if (!flip) {
        flip = true;
        if(previousIndex==-1){
        previousIndex = index;}
            update();

           } else {
             flip = false;
            if (previousIndex != index) {
             if (data[previousIndex]['index']!= data[index]['index']) {
                await Future.delayed(const Duration(milliseconds: 700) , () async {

                   cardKeys[index].currentState!.toggleCard();
});
                     wrongeanswers++;
                         update();

              } else {
                 cardFlips[previousIndex] = false;
                 cardFlips[index] = false;
                 correctanswers++;
                 previousIndex=-1;
                 playsound(AppAudioAsset.correct);
                 update();

 
                            }
                                           if (cardFlips.every((e) => e == false))  {
                      resultmessage(true);
                      int total = correctanswers*2-wrongeanswers;
                       await Future.delayed(const Duration(seconds: 2) , () async {
                        sharedpref = await SharedPreferences.getInstance();
                       int userid = sharedpref!.getInt("id")!.toInt();
                       int starscount =total>0 ? int.parse(stars(total)) : 0;
                       int response=0;
                     
                      response =await sqldb.updateData('''
                      UPDATE users SET
                       $si= $starscount
                      WHERE id=$userid
                      
                      ''');

                     
                      if(response>0){
                        Get.offAllNamed(AppRoute.home);
                        playsound(AppAudioAsset.unlock);
                      }
                       });
                              }
                          }
                          else{
                            previousIndex=-1;
                          }
                          
                        }
                        
    }
    

  }


  initial(){
    for (var i = 0; i < data.length; i++) {
      cardKeys.add(GlobalKey<FlipCardState>());
      cardFlips.add(false);
    }
   
  }

  init(){
  
    step = Get.arguments['step'];
    switch (step) {
    case 1:   { si = "s1i3" ;  data = matchingquestionss1;}
    break;
    case 2:   { si = "s2i3" ;  data = matchingquestionss2;}
    break;
    case 3:   { si = "s3i3" ;  data = matchingquestionss3;}
    break;
    case 4:   { si = "s4i3" ;  data = matchingquestionss4;}
    break;

    }

    data.shuffle();
        playTimerSound(AppAudioAsset.timer15);

}


@override
  void onInit() {
    init();
    initial();
    super.onInit();
  }
}