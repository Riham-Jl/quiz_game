import 'package:flutter/material.dart';
import 'package:haddithny/view/widgets/games%20shared/progressbar.dart';
import 'package:timer_count_down/timer_count_down.dart';


class GamesAppBar extends StatelessWidget implements PreferredSizeWidget{
  final  controller;
  final bool istimer;
  const GamesAppBar({
    Key? key, required this.controller, required this.istimer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
           controller.questionnumber<controller.totalnumber
          ? Text("السؤال ${controller.questionnumber+1} من ${controller.totalnumber}")
          : Text("إعادة السؤال المجاب بشكل خاطئ" , style: TextStyle(color: Colors.red[800] , fontWeight: FontWeight.bold),),
          istimer? Row(
            children: [
              const Icon(Icons.timer_sharp),
              Countdown(
                    controller: controller.timercontroller,
                    seconds: 15,
                    build: (BuildContext context, double time) => 
                       Text("${time.toInt()}" , ),
                    interval: const Duration(seconds: 1),
                    onFinished: () {
                       controller.answeringfunction();
                          },
    ),
            ],
          ):Container(),
       ],
          ) ),
             ProgressBar(controller: controller,),

      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(105);
}
