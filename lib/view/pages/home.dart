import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/controller/homecontroller.dart';
import 'package:haddithny/core/constant/color.dart';
import '../../core/functions/alertexitapp.dart';
import '../widgets/home/bigaslands.dart';
import '../widgets/home/bottomnavigationbar.dart';
import '../widgets/home/helloname.dart';
import '../widgets/home/smallislands.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.bluewhite,
      bottomNavigationBar: const MyBottomNavigationBar(),
      body:  WillPopScope(
        onWillPop: alertExitAPP,
        child: Container(
        padding: const EdgeInsets.only(top: 70),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColor.blue, AppColor.bluewhite
                        ],)
        ),
        child: controller.data!={}? Stack(
          children:[
             ListView.builder(
              itemCount: controller.steps.length,
              padding: const EdgeInsets.only(right: 10 , left: 10, bottom: 30 , top: 100),
              reverse: true,
              itemBuilder: (BuildContext context, int i) { 
                int n = i+1; 
                return ListView(
                  reverse: true,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                     SmallIslands( left: n.isOdd? true: false, steps: controller.steps[i] ,  light:  controller.step<n? true : false , step:n ),
                     BigIslands(
                      number: i+1, 
                      light:controller.step>n && controller.steps[i][0]>=4 && controller.steps[i][1]>=4 && controller.steps[i][2]>=4 && controller.steps[i][3]>=4
                      ? false : true,),
                     ]
                );},
                              
             
            ),
            
            controller.data['userimage']!=null
            ? HelloName(name: controller.data['username'], image: controller.data['userimage'],)
            :Container(),
            
            ]
        ):const Center(child: CircularProgressIndicator(),),
      )
      ));}
      );
    
  }
}

