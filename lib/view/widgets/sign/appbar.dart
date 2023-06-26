import 'package:flutter/material.dart';

class AppbarSign extends StatelessWidget {
  final String textone;
  final String texttwo;
  const AppbarSign({
    Key? key, required this.textone, required this.texttwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children:  [
      const SizedBox(height: 80,),
      Text( textone , style: Theme.of(context).textTheme.headline1),
      Text(texttwo ,  style: Theme.of(context).textTheme.headline6),])
               );
  }
}