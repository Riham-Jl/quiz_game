import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:haddithny/data/ordereing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constant/audioasset.dart';
import '../core/constant/routes.dart';
import '../core/functions/answersmessage.dart';
import '../core/functions/finalcorrectanswers.dart';
import '../core/functions/playsound.dart';
import '../core/functions/stars.dart';
import '../data/sql.dart';


class OrdernigController extends GetxController {


  int questionnumber=0;
  int correctanswers = 0;
  int finalcorrectanswers=0;

  bool ans = false;

  
  SqlDb sqldb = SqlDb();
  SharedPreferences?  sharedpref;
  int? step;
  String si = "";


    List questiongroup = [];
    int totalnumber = 0;





  
   List  trueitems() {
    return  questiongroup[questionnumber]['truelist'];
  }

   List  items (){
    return  questiongroup[questionnumber]['falselist'];
  
  }

      String questiontext (){
    return questiongroup[questionnumber]["title"];
  }
  

  reorderData(items,oldIndex , newIndex){
    if(newIndex>oldIndex) {newIndex--;}
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
    ans = true;
    update();

  }


  answeringfunction () async {
    if(listEquals(items(), trueitems())){
     if(questionnumber<totalnumber){  
                   correctanswers++;
                  finalcorrectanswers=finalcorrectans(step, correctanswers);
                   update();}
         resultmessage(true);
          
      }
      else {
        resultmessage(false);
        questiongroup.add(questiongroup[questionnumber]);

        

      }
      update();

    
    next();
    await Future.delayed(const Duration(milliseconds: 1100) , () async {
                   items().shuffle();
     });
    

  }



  next() async{
  await Future.delayed(const Duration(seconds: 2) , () async {
  if (questionnumber<questiongroup.length-1){
    questionnumber++;
    ans = false;
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
    



  init() async{
    questiongroup=[];
      step = Get.arguments['step'];
     switch (step) {
    case 1:   { 
      si = "s1i4" ;
      questiongroup.addAll(orderingquestions.where((e) => e['section']==1).toList().sublist(0,10));

    }
    break;
    case 2:   {
       si = "s2i4" ;
       questiongroup.addAll(orderingquestions.where((e) => e['section']==2).toList().sublist(0,10));
       questiongroup.addAll(orderingquestions.where((e) => e['section']==1  ).toList().sublist(0,5));
       }
    break;
    case 3:   {
       si = "s3i4" ;
       questiongroup.addAll(orderingquestions.where((e) => e['section']==3).toList().sublist(0,10));
       questiongroup.addAll(orderingquestions.where((e) => e['section']==1 || e['section']==2 ).toList().sublist(0,10)); 
       }
    break;
    case 4:   { 
      si = "s4i4" ;
      questiongroup.addAll(orderingquestions.where((e) => e['section']==4).toList().sublist(0,14));
       questiongroup.addAll(orderingquestions.where((e) => e['section']!=4 ).toList().sublist(0,11)); }
    break;

    
  }
      questiongroup.shuffle();
     totalnumber=questiongroup.length;
      
}


  @override
  void onInit() {
    init();
    super.onInit();
   
   
  }



}