import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/welcome/pages/login_page.dart';
import 'package:whatsapp_clone/features/welcome/pages/user_info_page.dart';
import 'package:whatsapp_clone/features/welcome/pages/verification_page.dart';
import 'package:whatsapp_clone/features/welcome/pages/welcome_page.dart';

class Routes {
  static const String welcome = "Welcome";
  static const String login = "Login";
  static const String verification = "Verification";
  static const userInfo = "User-info";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(
          builder: (context) => const Welcome(),
        );
      case login:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case verification:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => Verification(
                  verificationId: args['smsCodeId'],
                  phoneNumber: args['phoneNumber'],
                ));
      case userInfo:
        return MaterialPageRoute(builder: (context) => const UserInfoPage());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text("No Page Route Provided."),
                  ),
                ));
    }
  }
}
