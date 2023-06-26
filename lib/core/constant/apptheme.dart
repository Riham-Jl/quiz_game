import 'package:flutter/material.dart';

import 'color.dart';

ThemeData mytheme = ThemeData(
  
        fontFamily: "NotoSansArabic",
       colorScheme: ColorScheme.fromSwatch().copyWith(
           primary: AppColor.teal,
           secondary: AppColor.lightTeal),
       textTheme: const TextTheme(
          
          headline1: TextStyle(fontWeight: FontWeight.w600 , fontSize: 48 , height: 1.5, color: AppColor.boldBlue),
          headline2: TextStyle(fontWeight: FontWeight.w600 , fontSize: 40 , ),
          headline3: TextStyle(fontWeight: FontWeight.w600 , fontSize: 36 , ),
          headline4: TextStyle(fontWeight: FontWeight.w600 , fontSize: 30 ,),
          headline5: TextStyle(fontWeight: FontWeight.w700 , fontSize: 24 ,),
          headline6: TextStyle(fontWeight: FontWeight.w600 , fontSize: 18 ,),
          bodyText1: TextStyle(fontWeight: FontWeight.w500 , fontSize: 16 ,),
          bodyText2: TextStyle(fontWeight: FontWeight.w500 , fontSize: 14 ,),
          button: TextStyle(fontWeight: FontWeight.w500 , fontSize: 14 , height: 2),
        ),
        //bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.black)
        appBarTheme:  AppBarTheme(
          backgroundColor: AppColor.teal.withOpacity(0),
          //centerTitle: true,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColor.black),
          titleTextStyle: const TextStyle(
          color: AppColor.black,
       fontWeight: FontWeight.bold,
       fontSize: 18
          ),),
          
       // floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColor.red)
);
