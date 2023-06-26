import 'package:get/get.dart';
import 'package:haddithny/core/constant/routes.dart';
import 'package:haddithny/core/functions/answersmessage.dart';
import 'package:haddithny/core/functions/stars.dart';
import 'package:haddithny/data/choosing.dart';
import 'package:haddithny/data/sql.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_count_down/timer_controller.dart';
import '../core/constant/audioasset.dart';
import '../core/functions/finalcorrectanswers.dart';
import '../core/functions/playsound.dart';


class ChoosingController extends GetxController {

  int questionnumber=0;
  int correctanswers = 0;
  int finalcorrectanswers=0;

  bool ans = false;




  
  SqlDb sqldb = SqlDb();
  SharedPreferences?  sharedpref;
  int? step;
  String si = "";

  String choosedanswer = "";
  String? redanswer;
  String? greenanswer;
  //List questiongroup = [];


  List questiongroup = [];
   int totalnumber  = 0;

  
CountdownController timercontroller = CountdownController();
 

    String questiontext (){
    return questiongroup[questionnumber]["question"];
  }


   String trueanswer (){
    return questiongroup[questionnumber]["answer"];
  }

   List choises (){
    return questiongroup[questionnumber]['choises'];
    
  }

    chooseanswer(val){
    choosedanswer = val;
    ans = true;
    update();
  }


    answeringfunction() {
      stopTimerSound();
      timercontroller.pause();
         ans=false;
        if (trueanswer()==choosedanswer){
          if(questionnumber<totalnumber){  
            greenanswer = choosedanswer;
                   correctanswers++;
            finalcorrectanswers=finalcorrectans(step, correctanswers);

                   update();}
         resultmessage(true);

      }
      else {
       redanswer =choosedanswer;
       update();
       resultmessage(false);
      questiongroup.add(questiongroup[questionnumber]);
    }
    choosedanswer="";
          next();

    }

next() async{
  await Future.delayed(const Duration(seconds: 2) , () async {
  if (questionnumber<questiongroup.length-1){
    timercontroller.restart();
    playTimerSound(AppAudioAsset.timer15);
    questionnumber++;
      redanswer = "";
      greenanswer = "";
      update();
     }
    else  {
     sharedpref = await SharedPreferences.getInstance();
          int userid = sharedpref!.getInt("id")!.toInt();
          int starscount = int.parse(stars(finalcorrectanswers));
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
    }
    


  });
  }


    




init() async {

  
      step = Get.arguments['step'];


    switch (step) {
    case 1:   { 
      si = "s1i1" ;
      questiongroup.addAll(choosingquestions.where((e) => e['section']==1).toList().sublist(0,10));

    }
    break;
    case 2:   {
       si = "s2i1" ;
       questiongroup.addAll(choosingquestions.where((e) => e['section']==2).toList().sublist(0,10));
       questiongroup.addAll(choosingquestions.where((e) => e['section']==1  ).toList().sublist(0,5));
       }
    break;
    case 3:   {
       si = "s3i1" ;
       questiongroup.addAll(choosingquestions.where((e) => e['section']==3).toList().sublist(0,10));
       questiongroup.addAll(choosingquestions.where((e) => e['section']==1 || e['section']==2 ).toList().sublist(0,10)); 
       }
    break;
    case 4:   { 
      si = "s4i1" ;
      questiongroup.addAll(choosingquestions.where((e) => e['section']==4).toList().sublist(0,14));
       questiongroup.addAll(choosingquestions.where((e) => e['section']!=4 ).toList().sublist(0,11)); }
    break;

    
  }
      questiongroup.shuffle();
     totalnumber=questiongroup.length;
       await Future.delayed(const Duration(milliseconds: 10) , () async {

      timercontroller.start();
      playTimerSound(AppAudioAsset.timer15);
       });
    update();

  
}

  @override
  void onInit() {

    init();

    super.onInit();
  }

}