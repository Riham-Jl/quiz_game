import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/core/functions/answersmessage.dart';
import 'package:haddithny/core/functions/finalcorrectanswers.dart';
import 'package:haddithny/data/filling.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constant/audioasset.dart';
import '../core/constant/routes.dart';
import '../core/functions/playsound.dart';
import '../core/functions/stars.dart';
import '../data/sql.dart';

class FillingController extends GetxController{

  int questionnumber=0;
  int correctanswers = 0;
  int finalcorrectanswers=0;

  bool ans = false;

  SqlDb sqldb = SqlDb();
  SharedPreferences?  sharedpref;
  int? step;
  String si = "";


  List coloring = [];
  List acceptanswers = [];
  List drags = [];
  Map puzzle = {};

 
List questiongroup = [];
int totalnumber =0;

  
 


 

    List questiontext (){
    return questiongroup[questionnumber]["question"];
  }


   List trueanswers (){
    return questiongroup[questionnumber]["answers"];
  }

   List choises (){
    return questiongroup[questionnumber]['choises'];
  }





   onaccept(Map data ,int target){
    if(acceptanswers[target]==""){
    acceptanswers[target] = data['ans'];
    drags[data['drag']] = true;
    puzzle.addAll({target:data['drag']});
     if( drags.any((e) => e==false)){ans =false;} else {ans=true;}


    update();
   }
   }

   reset(i){
    int deleteindex = puzzle[i];
    drags[deleteindex] = false ;
    acceptanswers[i] = "";
    puzzle.removeWhere((key, value) => key==i);
     if( drags.any((e) => e==false)){ans =false;} else {ans=true;}

    update();
   }

   answeringfunction(){
       int i =0;
    for (i; i < trueanswers().length; i++) {
   if(acceptanswers[i]==trueanswers()[i]){
    coloring[i]=Colors.green;
   }
   else {
    coloring[i]=Colors.red;
   }
  }
  update();

   if(listEquals(acceptanswers, trueanswers())){
      if(questionnumber<totalnumber){  
                   correctanswers++;
                 finalcorrectanswers=finalcorrectans(step, correctanswers);

                   update();}
         resultmessage(true);
         

   }
   else {
      questiongroup.add(questiongroup[questionnumber]);
      resultmessage(false);
   }
   next();
         }
   


next() async{
  await Future.delayed(const Duration(seconds: 2) , () async {
  if (questionnumber<questiongroup.length-1){
    questionnumber++;
        initialdata();

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
    
 
    update();

  });
  }

initialdata(){
  ans = false;
    coloring = [];
    acceptanswers = [];
    drags = [];
    puzzle = {};
    int i = 0;
    for (i; i < choises().length; i++) {
      acceptanswers.add("");
      drags.add(false);
      coloring.add(Colors.grey.withOpacity(0));
  }
}

init() async{
  
    step = Get.arguments['step'];
 switch (step) {
    case 1:   { 
      si = "s1i2" ;
      questiongroup.addAll(fillingquestions.where((e) => e['section']==1).toList().sublist(0,10));

    }
    break;
    case 2:   {
       si = "s2i2" ;
       questiongroup.addAll(fillingquestions.where((e) => e['section']==2).toList().sublist(0,10));
       questiongroup.addAll(fillingquestions.where((e) => e['section']==1  ).toList().sublist(0,5));
       }
    break;
    case 3:   {
       si = "s3i2" ;
       questiongroup.addAll(fillingquestions.where((e) => e['section']==3).toList().sublist(0,10));
       questiongroup.addAll(fillingquestions.where((e) => e['section']==1 || e['section']==2 ).toList().sublist(0,10)); 
       }
    break;
    case 4:   { 
      si = "s4i2" ;
      questiongroup.addAll(fillingquestions.where((e) => e['section']==4).toList().sublist(0,15));
       questiongroup.addAll(fillingquestions.where((e) => e['section']!=4 ).toList().sublist(0,10)); }
    break;

    
  }
      questiongroup.shuffle();
     totalnumber=questiongroup.length;


}

 

@override
  void onInit() {   
    init();
    initialdata();
    super.onInit();
  }


}