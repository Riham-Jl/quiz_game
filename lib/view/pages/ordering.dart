import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/core/functions/alertexitapp.dart';
import 'package:haddithny/view/widgets/games%20shared/answeringbutton.dart';
import 'package:haddithny/view/widgets/games%20shared/gamesappbar.dart';
import 'package:haddithny/view/widgets/games%20shared/gamsebackcontainer.dart';
import '../../controller/ordernigcontroller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../widgets/ordering/orderingcards.dart';
import '../widgets/games shared/questionstitle.dart';

class OrderingPage extends StatelessWidget {
  
  const OrderingPage({super.key});

  @override
  Widget build(BuildContext context) {

      Get.put(OrdernigController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: 
      GetBuilder<OrdernigController>(builder: (controller) {
      return Scaffold(
      backgroundColor: AppColor.pink,
        appBar:  GamesAppBar(controller: controller, istimer: false,),
        body: WillPopScope(
        onWillPop: alertExitGame,
        child: GamesBackContainer(
          image: AppImageAsset.pinkBackground,
          child: ListView(
            children: [
               QuestionTitle(title: controller.questiontext()),
              const OrderingCards(),
              const SizedBox(height: 30,),
              AnsweringButton(controller: controller)
        ],
      )))
      );
      }

     )
      
      
    );
  }
}


