import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/signincontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
class SignInPersons extends StatelessWidget {
  const SignInPersons({
    Key? key,
  }) : super(key: key);

  //final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (controller) {
      return Expanded(
      child: controller.isloading==false?  GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  crossAxisCount: 2 , crossAxisSpacing: 30 , mainAxisSpacing: 30),
                itemCount: controller.users.length,
                itemBuilder: (context,i){
                return InkWell(
                  onTap: (){
                    controller.chooseuser(controller.users[i]['id']);
                  } ,
                  onLongPress: (){
                    controller.deleteuser(controller.users[i]['id']);
                  },
                  child: 
                      Stack(
                        alignment: Alignment.bottomCenter,
                          clipBehavior: Clip.none,
                          children:[
                               SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: Image.asset("${AppImageAsset.rootimages}/${controller.users[i]['userimage']}" , fit: BoxFit.fill,)),
                                controller.chooseduser==controller.users[i]['id']? Positioned( bottom: 0, right: 0, width: 35 , height: 35 , 
                                child: Container (
                                  decoration: const BoxDecoration(
                                     borderRadius: BorderRadius.all(Radius.circular(50)),
                                     color: AppColor.teal
                                  ),
                                  child: const Icon(Icons.check , color: AppColor.white, size: 30,),
                                   )):Container(),
                                   Positioned(bottom: -25, child: Text("${controller.users[i]['username']}" , style: Theme.of(context).textTheme.bodyText1,))
                          ]),
                          
                      
                    
                  
                );
              }): const Center(child: CircularProgressIndicator(),),
      
    )  ;} );
  }
}

