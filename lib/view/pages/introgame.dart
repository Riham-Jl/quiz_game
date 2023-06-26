import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/controller/introgamecontroller.dart';
import 'package:haddithny/data/introgames.dart';
import '../widgets/introcontainer.dart';

class IntroGames extends StatelessWidget {
  const IntroGames({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(IntroGameController());

    return GetBuilder<IntroGameController>(builder: (controller) {
       return controller.i!=null
       ? Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: introcolors[controller.i!],
        appBar: AppBar(
          title: const Text("عودة"),
        ),
        body: Container(
        height: double.infinity, 
        width: double.infinity,
        decoration:  BoxDecoration(
            image: DecorationImage(image: AssetImage(introimages[controller.i!]) , fit: BoxFit.fill) ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 80,),
               IntroContainer(
                title: introtext[controller.i!]['name'], 
                descreption: introtext[controller.i!]['desc'],
                 color: introcolors[controller.i!],
                 onpressed: (){controller.startgame();},),
              
            ]),
        ),
    )):const Scaffold();});
  }
}

