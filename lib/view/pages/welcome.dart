import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/controller/welcomecontroller.dart';
import 'package:haddithny/core/constant/imageasset.dart';
import 'package:haddithny/view/widgets/games%20shared/gamsebackcontainer.dart';
import '../widgets/welcome/welcomecontainer.dart';
import '../widgets/welcome/welcomelogo.dart';
import '../widgets/welcome/welcometitle.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
      Get.put(WelcomeController());
    return Scaffold(
      body: GamesBackContainer(
        image: AppImageAsset.blueBackground,
        child: Column(
            children: [
              const WelcomeTitle(),
              Stack(
                clipBehavior: Clip.none,
                children: const [
                  WelcomeContainer(),
                  WelcomeLogo()
                ],
              ),

          ]),
          ),
          
      
    );
  }
}





