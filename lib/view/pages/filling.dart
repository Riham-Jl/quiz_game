import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/core/functions/alertexitapp.dart';
import 'package:haddithny/view/widgets/games%20shared/answeringbutton.dart';

import '../../controller/fillingcontroller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../widgets/filling/dragcontainer.dart';
import '../widgets/games shared/gamesappbar.dart';
import '../widgets/games shared/questionstitle.dart';
import '../widgets/filling/targetcontainer.dart';

class FillingPage extends StatelessWidget {
  
  const FillingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FillingController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: 
      GetBuilder<FillingController>(builder: (controller) {
      return Scaffold(
      backgroundColor: AppColor.orange,
        appBar: GamesAppBar(controller:controller , istimer: false,),
        body:WillPopScope(
        onWillPop: alertExitGame,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal:15),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImageAsset.orangeBackground) , fit: BoxFit.fill) ),
          child: ListView(
            children: [
                 const QuestionTitle(title: "أمسكي الكلمة وضعيها في مكانها الصحيح"),
                 Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      ...List.generate(controller.choises().length, (index) { 
                      return DragContainer(i: index);})
                    ],
            ),
                      ...List.generate(controller.choises().length, (index) {           
                           return TargetContainer(index: index,);}
                           ),                  
                     AnsweringButton(controller: controller,)
                
          ],
        )
             )
    ));
   }));
  }
}

