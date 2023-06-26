import 'package:flutter/material.dart';
import 'package:haddithny/core/constant/imageasset.dart';

class BigIslands extends StatelessWidget {
  final bool light;
  final int number;
  const BigIslands({
    Key? key, required this.number, required this.light,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return number==1 || number==3? Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  [
         Image.asset(AppImageAsset.cloud),
        Opacity(opacity: light?0.3 : 1,
        child: 
          Image.asset("${AppImageAsset.rootimages}/bigisland$number.png" , ),
         ),
      ]
    ):
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  [
        Opacity(opacity: light?0.5 : 1,
        child: 
          Image.asset("${AppImageAsset.rootimages}/bigisland$number.png" , ),
         ),
          Image.asset(AppImageAsset.heart)
      ],
    );
  }
}