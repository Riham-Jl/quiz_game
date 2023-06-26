import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class SignUpName extends StatelessWidget {
  final TextEditingController? name;
  const SignUpName({
    Key? key, required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Form(
        child: TextFormField(
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.tag_faces),
            contentPadding: EdgeInsets.symmetric(vertical: 0 , horizontal: 20),
          hintText: "أدخلي الاسم",
          filled: true , fillColor: AppColor.white,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.teal, width: 3))
        ),
        style: const TextStyle (fontSize: 18),
          controller: name,
                    
        ),
      ),
    );
  }
}