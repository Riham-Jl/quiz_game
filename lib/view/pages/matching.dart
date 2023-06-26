import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/core/functions/alertexitapp.dart';
import 'package:haddithny/view/widgets/games%20shared/gamsebackcontainer.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../controller/matchingcontroller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../widgets/matching/matchingcard.dart';

class MatchingPage extends StatelessWidget {
  const MatchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchingController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: 
      GetBuilder<MatchingController>(builder: (controller) {
      return Scaffold(
      backgroundColor: AppColor.purple,
        appBar: AppBar(
          centerTitle: true,
         title: controller.timer? Countdown(
      seconds: 15,
      build: (BuildContext context, double time) => 
      Text("${time.toInt()}" ,style: const TextStyle(color: AppColor.white), ),
      interval: const Duration(seconds: 1),
      onFinished: () {
        controller.timerfinish();
      },
    ): const Text("طابقي عنوان الحديث مع الراوي" , style: TextStyle(color: AppColor.white),),
        ),
        body: WillPopScope(
        onWillPop: alertExitGame,
        child: GamesBackContainer(
          image: AppImageAsset.purpleBackground,
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: SingleChildScrollView(
                  child:  Wrap(
                    children:
                       List.generate( controller.data.length, (index) { 
                           return MatchingCard(i:index);
                           }
                                  )
                  )
                ),
        )
              ))));
      })
    );
  }
}

