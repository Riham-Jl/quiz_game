import 'package:get/get.dart';
import 'package:haddithny/core/constant/color.dart';
import 'package:haddithny/core/constant/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constant/audioasset.dart';
import '../core/functions/playsound.dart';
import '../data/sql.dart';

class SignInController extends GetxController{
  SharedPreferences? sharedpref;
    SqlDb sqldb = SqlDb();
    bool isloading = true;
    List users = [];
    int? chooseduser;

    Future readdata() async {
     sharedpref = await SharedPreferences.getInstance();

    List<Map> response = await sqldb.readData("SELECT * FROM users");
    users = [];
    users.addAll(response);
    isloading=false;
    update();
    }

    deleteuser(id){
      Get.defaultDialog(
          textConfirm: "نعم",
          textCancel: "لا",
          cancelTextColor: AppColor.black,
          confirmTextColor: AppColor.black,
          title: "تنبيه",
          middleText: "هل أنت متأكدة من حذف هذا الحساب؟",
          onConfirm: ()async{
            int response = await sqldb.deleteData("DELETE FROM users WHERE id = $id");
            if (response>0){
                 users.removeWhere((element) => element['id']==id); 
                  }
                  Get.back();
              update();
              },
          onCancel: (){
            }
        );
      
    }

    chooseuser(id ){
      chooseduser = id;
      update();
       playsound(AppAudioAsset.choose);
    }

    go()async{
      if(chooseduser!=null){
      sharedpref!.setInt("id", chooseduser!);
      Get.offAllNamed(AppRoute.home);
      playsound(AppAudioAsset.home);
      }

    }


    back(){
      Get.offAllNamed(AppRoute.welcome);
      playsound(AppAudioAsset.warning);
    }

    @override
  void onInit() {
    readdata();
    super.onInit();
  }
}