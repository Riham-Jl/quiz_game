import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haddithny/core/constant/color.dart';
import '../../../controller/fillingcontroller.dart';

class TargetContainer extends GetView<FillingController> {
  final int index;
  const TargetContainer({
    Key? key, required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
       ListView(
        
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children:[ 
          controller.questiontext()[index]["b"]!=""
          ?Container(
            margin: const EdgeInsets.all(2),
            child: Text (controller.questiontext()[index]["b"] ,textAlign: TextAlign.center,  style: const TextStyle(fontSize: 16 ,),))
            :Container(),
          Center(
            child: DragTarget<Map>(
              onAccept: (data) {
              controller.onaccept(data , index);
              },
              builder: (context , _ ,__) => Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: AppColor.white,
                  border: Border.all(width: 2 , color: controller.coloring[index]),
                ),
                height: 50,
                width: 130,
                child: MaterialButton(
                  onPressed :(){
                    controller.reset(index);
                  },
                  child: Text(controller.acceptanswers[index])),
              )
              ),
          ),
            controller.questiontext()[index]["a"]!=""
            ? Container(
              margin: const EdgeInsets.all(2),
              child: Text (controller.questiontext()[index]["a"] , textAlign: TextAlign.center,   style: const TextStyle(fontSize: 16  )))
              :Container()]
    
    );
  }
}

