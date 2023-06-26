import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class SignButtons extends StatelessWidget {
  final void Function()? onpressedbtn1;
  final void Function()? onpressedbtn2;
  const SignButtons({
    Key? key, this.onpressedbtn1, this.onpressedbtn2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: 70,
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children:[
         
           MaterialButton(
             height: 40,
             minWidth: 130,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
             color: AppColor.teal,
             onPressed: onpressedbtn1,
             child: const Text("جاهزة للتحدي" , style: TextStyle(color: AppColor.white , fontSize: 18, fontWeight: FontWeight.bold),),
             ),
         
           MaterialButton(
           height: 40,
            minWidth: 130,
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: const BorderSide(color: AppColor.teal , width: 3)
           ),
           color: AppColor.white,
           onPressed:onpressedbtn2,
           child: const Text("تراجع " , style: TextStyle(color: AppColor.teal, fontSize: 18, fontWeight: FontWeight.bold),),
           )
       ] 
                  
                ),
    );
  }
}