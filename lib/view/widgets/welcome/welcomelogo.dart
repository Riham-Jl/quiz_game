import 'package:flutter/material.dart';

import '../../../core/constant/imageasset.dart';


class WelcomeLogo extends StatelessWidget {
  const WelcomeLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: 320,
      height: 110,
      top: -65,
      child: Center(child: Image.asset(AppImageAsset.logo ,)));
  }
}