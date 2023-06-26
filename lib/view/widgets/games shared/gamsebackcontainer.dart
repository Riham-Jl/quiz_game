import 'package:flutter/material.dart';


class GamesBackContainer extends StatelessWidget {
  final Widget? child;
  final String image;
  const GamesBackContainer({super.key, this.child, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal:15),
          decoration:  BoxDecoration(
            image: DecorationImage(image: AssetImage(image) , fit: BoxFit.fill) ),
          child: child );
  }
}