import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/controller/signupcontroller.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
class SignUpPersons extends StatelessWidget {
  const SignUpPersons({
    Key? key,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) =>Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2 , crossAxisSpacing: 30 , mainAxisSpacing: 30),
                itemCount: controller.persons.length,
                itemBuilder: (context,i){
                return InkWell(
                  onTap: (){
                    controller.chooseimage(controller.persons[i]['image']);
                  },
                  child: 
                  Stack(
                    clipBehavior: Clip.none,
                    children:[
         SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset("${AppImageAsset.rootimages}/${controller.persons[i]['image']}" , fit: BoxFit.fill,)),
          controller.choosedimage==controller.persons[i]['image']? Positioned( bottom: 0, right: 0, width: 35 , height: 35 , 
          child: Container (
            decoration: const BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(50)),
               color: AppColor.teal
            ),
            child: const Icon(Icons.check , color: AppColor.white, size: 30,),
             )):Container(),
                    ])
                  
                );
              }),
      
    ));
  }
}

