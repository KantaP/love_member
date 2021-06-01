import 'package:boilerplate/ui/createAccount/enter_mobile_number.dart';
import 'package:boilerplate/ui/getStarted/get_started.dart';
import 'package:boilerplate/ui/home/home.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/ui/splash/splash.dart';
import 'package:boilerplate/ui/termsAndConditions/terms_and_conditions.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String getStarted = '/get_started';
  static const String termsAndConditions = '/terms_and_condition';
  static const String createStep1 = '/create_mobile_number';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    getStarted: (BuildContext context) => GetStartedPage(),
    termsAndConditions: (BuildContext context) => TermsAndConditionsPage(),
    createStep1: (BuildContext context) => CreateMobileNumberPage(),
  };
}



