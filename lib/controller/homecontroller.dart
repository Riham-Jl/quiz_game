import 'package:get/get.dart';
import 'package:haddithny/core/constant/routes.dart';
import 'package:haddithny/data/choosing.dart';
import 'package:haddithny/data/filling.dart';
import 'package:haddithny/data/matching.dart';
import 'package:haddithny/data/ordereing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constant/audioasset.dart';
import '../core/functions/playsound.dart';
import '../data/sql.dart';

class HomeController extends GetxController{

  SqlDb sqldb = SqlDb();
  bool isloading = true;
  SharedPreferences?  sharedpref;
  int? id;
  Map data = {};
  int step = 0;
  List steps = [];
  int selectedIndex = 1;




  tabchange(i){
    if(i==2){
      stopBackSound();
      Get.offAllNamed(AppRoute.welcome);
    playsound(AppAudioAsset.warning);}
    else if(i==0){selectedIndex=1;}
    else {
      selectedIndex=i;
    }
    
    update();
  }




  

  

  Future readdata() async {
        playBackSound(); 

     sharedpref = await SharedPreferences.getInstance();
     id = sharedpref!.getInt("id");
    List<Map> response = await sqldb.readData("SELECT * FROM users WHERE id = '$id'");
    data={};
    data.addAll(response[0]);
    //step = data['step'];
    steps.add([data['s1i1'], data['s1i2'],data['s1i3'], data['s1i4'] ] );
    steps.add([data['s2i1'], data['s2i2'],data['s2i3'], data['s2i4'] ] );
    steps.add([data['s3i1'], data['s3i2'],data['s3i3'], data['s3i4'] ] );
    steps.add([data['s4i1'], data['s4i2'],data['s4i3'], data['s4i4'] ] );
    isloading=false;

    if(data['s4i1']>=4 && data['s4i2']>=4 && data["s4i3"]>=4 && data["s4i4"]>=4){
      await Future.delayed(const Duration(milliseconds: 300) , () async {
      playsound(AppAudioAsset.end);
      step =5;});
    }
    else if(data['s3i1']>=4 && data['s3i2']>=4 && data["s3i3"]>=4 && data["s3i4"]>=4){
      step =4;
    }
    else if(data['s2i1']>=4 && data['s2i2']>=4 && data["s2i3"]>=4 && data["s2i4"]>=4){
      step=3;
    }
    else if(data['s1i1']>=4 && data['s1i2']>=4 && data["s1i3"]>=4 && data["s1i4"]>=4){
      step = 2;
    }
    else {step = 1;}

  
        update();

     
    }

    startgame(int step , int game){

      playsound(AppAudioAsset.buttons);
      Get.toNamed(AppRoute.intro ,arguments: {'step' : step , 'game' : game});
    }


    @override
  void onInit() {  
    readdata();
    choosingquestions.shuffle();
    fillingquestions.shuffle();
    matchingquestionss1.shuffle();
    orderingquestions.shuffle();    

    super.onInit();
  }

}