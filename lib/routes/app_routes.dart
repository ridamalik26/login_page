import 'package:flutter/material.dart';
import '../screens/login_page.dart';
import '../screens/signup_page.dart';
import '../screens/welcome_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String welcome = '/welcome';

  static Map<String, WidgetBuilder> get routes => {
    login: (context) => const LoginPage(),
    signup: (context) => const SignUpPage(),
    welcome: (context) =>  const WelcomePage(email: 'Guest',),
  };
}
