import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

import '../../../controller/homecontroller.dart';
import '../../../core/constant/color.dart';

class MyBottomNavigationBar extends GetView<HomeController>{
  const MyBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoltenBottomNavigationBar(
      domeHeight: 20,
      domeCircleSize: 50,
    selectedIndex: controller.selectedIndex,
    onTabChange: (i) {
     controller.tabchange(i);
    },
    tabs: [
      MoltenTab(
        icon: const Icon(Icons.people_outline , size: 35,),
        title: const Text("تنافس" , style: TextStyle(color: AppColor.gray2 , fontWeight: FontWeight.bold),)
      ),
      MoltenTab(
        icon: const Icon(Icons.home_outlined , size: 35,),
        title: const Text("الرئيسية")
      ),
      MoltenTab(
        icon: const Icon(Icons.exit_to_app, size: 35,),
        title: const Text("خروج")
      ),
    ],
   );
  }
}

