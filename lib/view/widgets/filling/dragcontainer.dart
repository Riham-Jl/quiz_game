import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/view/widgets/filling/draggablecontainer.dart';
import '../../../controller/fillingcontroller.dart';
import '../../../core/constant/color.dart';

class DragContainer extends GetView<FillingController> {
  final int i;
  const DragContainer( {
    Key? key, required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: AppColor.white

      ),
      child:   controller.drags[i]==false
      ? Draggable<Map>(
        data: {"ans":controller.choises()[i] , "drag":i},
        feedback: DraggableContainer(text : controller.choises()[i]) ,
          childWhenDragging: Container(
            decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: AppColor.white

      ),
          width: 120,
          height: 50, ) ,
        child: DraggableContainer(text : controller.choises()[i]),
          ):
          Container(
            decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: Colors.grey[400],

      ),
          width: 120,
          height: 50,

          )
                 
    );
  }
}