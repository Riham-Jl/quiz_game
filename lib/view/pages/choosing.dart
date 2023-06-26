import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/core/constant/color.dart';
import 'package:haddithny/core/functions/alertexitapp.dart';
import 'package:haddithny/view/widgets/games%20shared/gamsebackcontainer.dart';
import '../../controller/choosingcontroller.dart';
import '../../core/constant/imageasset.dart';
import '../widgets/games shared/answeringbutton.dart';
import '../widgets/choosing/choosingchoises.dart';
import '../widgets/games shared/gamesappbar.dart';
import '../widgets/games shared/questionstitle.dart';


class ChoosingPage extends StatelessWidget {
  const ChoosingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChoosingController() ,permanent: false );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: 
      GetBuilder<ChoosingController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColor.teal,
        appBar: GamesAppBar(controller:controller , istimer: true,),
        body:WillPopScope(
        onWillPop: alertExitGame,
        child: GamesBackContainer(
          image: AppImageAsset.tealBackground,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                 QuestionTitle(title: controller.questiontext()),
                  ...List.generate(controller.choises().length, (index) { 
                   return ChoosingChoises(i: index);}),
               Expanded(child: Container(),),
               AnsweringButton(controller: controller,),
               

              
    ],),  )
      
           
        
      ));
  }));
  }
}







