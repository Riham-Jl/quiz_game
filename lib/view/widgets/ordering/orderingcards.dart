import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/ordernigcontroller.dart';
import '../../../core/constant/color.dart';

class OrderingCards extends GetView<OrdernigController>{
  const OrderingCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdernigController>(builder: (controller) {
      return Container(
      margin: const EdgeInsets.all(5),
      child: ReorderableListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    onReorder:((oldIndex, newIndex) {
       controller.reorderData(controller.items(),oldIndex, newIndex);}),
    children: <Widget>[
    for(final item in controller.items())
      Card(
        key: ValueKey(item),
        child: Container(
              decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                 ),
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(item , textAlign: TextAlign.center, style: const TextStyle( fontSize: 16),)),
      )
    
            
            ]
          ),
          );});
  }
}