import 'package:get/get.dart';
import 'package:haddithny/view/pages/choosing.dart';
import 'package:haddithny/view/pages/filling.dart';
import 'package:haddithny/view/pages/home.dart';
import 'package:haddithny/view/pages/introgame.dart';
import 'package:haddithny/view/pages/matching.dart';
import 'package:haddithny/view/pages/ordering.dart';
import 'package:haddithny/view/pages/signin.dart';
import 'package:haddithny/view/pages/signup.dart';
import 'package:haddithny/view/pages/welcome.dart';
import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes = [


  //GetPage(name: "/", page: () => const Test()),
  GetPage(name: "/", page: () => const WelcomePage()),
  GetPage(name: AppRoute.welcome, page: () => const WelcomePage()),
  GetPage(name: AppRoute.signup, page:() => const SignUpPage() ),
  GetPage(name: AppRoute.signin, page: () => const SigninPage()),
  GetPage(name: AppRoute.home, page:() => const HomePage() ),
  GetPage(name: AppRoute.intro, page: ()=> const IntroGames()),
  GetPage(name: AppRoute.choosing, page: ()=> const ChoosingPage()),
  GetPage(name: AppRoute.filling, page: ()=> const FillingPage()),
  GetPage(name: AppRoute.matching, page: ()=> const MatchingPage ()),
  GetPage(name: AppRoute.ordering, page: ()=> const OrderingPage()),


  
   



];
