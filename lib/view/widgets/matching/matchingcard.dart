import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/matchingcontroller.dart';
import '../../../core/constant/imageasset.dart';

class MatchingCard extends GetView<MatchingController> {
  final int i;
  const MatchingCard({
    Key? key, required this.i
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FlipCard(
      key: controller.cardKeys[i],
      onFlip: () {
       controller.onflip(i);
      },
      
      
      direction: FlipDirection.HORIZONTAL,
      flipOnTouch: controller.cardFlips[i],
      back:  Container(
        margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
        padding: const EdgeInsets.all(10),
        width: 145,
        height: 105,
         decoration:  const BoxDecoration(
          gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.white , Color.fromARGB(255, 204, 202, 202) , Colors.white
      ],
    ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
         child: Image.asset(AppImageAsset.logo ) ,
      ),
      front: Container(
         margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
        padding: const EdgeInsets.all(4),
        width: 145,
        height: 100,
      decoration: BoxDecoration(
         gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.white , Color.fromARGB(255, 204, 202, 202) , Colors.white
      ],
    ),
      border: Border.all(width: 4 ,
       color:!controller.cardFlips[i] & !controller.start? controller.colors[controller.data[i]['index']] : Colors.white.withOpacity(0)),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
     ),
        child: Center(
          child: Text(
            "${controller.data[i]['data']}",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    
                  );
  }
}