import 'package:flutter/material.dart';
import 'package:stargazer/features/camera/presentation/camera_page.dart';
import 'package:stargazer/features/chat/presentation/screens/chat/chat_screen.dart';

import 'package:stargazer/features/home/presentation/home_page.dart';
import 'package:stargazer/features/login/presentation/login_page.dart';
import 'package:stargazer/features/register/presentation/register_page.dart';
import 'package:stargazer/features/setting/presentation/view/LanguageSelect.dart';
import 'package:stargazer/features/setting/presentation/view/SettingScreen.dart';
import 'package:stargazer/features/splash/presentations/splash_page.dart';
import '../constants.dart';

class AppRoutes {
  static const List<String> mainRoutes = [
    RouteConstants.splash,
    RouteConstants.home,
    RouteConstants.setting,
    RouteConstants.language,
    RouteConstants.login,
    RouteConstants.register,
    RouteConstants.camera,
    RouteConstants.chat,
  ];

  static const List<String> homeRoutes = [
    RouteConstants.camera,
    RouteConstants.chat,
  ];

  static const List<String> cameraRoutes = [
    RouteConstants.face,
    RouteConstants.hand,
    RouteConstants.prediction,
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    RouteConstants.splash: (context) => const SplashPage(),
    RouteConstants.home: (context) => const HomePage(),
    RouteConstants.setting: (context) => const SettingScreen(),
    RouteConstants.login: (context) => const LoginPage(),
    RouteConstants.register: (context) => const RegisterPage(),
    RouteConstants.camera: (context) => const CameraPage(),
    RouteConstants.chat: (context) => ChatScreen(),
  };

  static Map<String, WidgetBuilder> getPages() {
    return {for (var route in mainRoutes) route: (context) => getPage(route)};
  }

  static List<Widget> getHomePages() {
    return homeRoutes.map((route) => getPage(route)).toList();
  }

  static Widget getPage(String route) {
    switch (route) {
      case RouteConstants.splash:
        return const SplashPage();
      case RouteConstants.home:
        return const HomePage();
      case RouteConstants.setting:
        return const SettingScreen();
      case RouteConstants.language:
        return const LanguageSelect();
      case RouteConstants.login:
        return const LoginPage();
      case RouteConstants.register:
        return const RegisterPage();
      case RouteConstants.camera:
        return const CameraPage();
      case RouteConstants.chat:
        return ChatScreen();

      default:
        throw Exception('Route not found');
    }
  }

  static const initialRoute = RouteConstants.splash;

  static bool isMainRoute(String routeName) {
    return mainRoutes.contains(routeName);
  }

  static bool isRootRoute(String routeName) {
    return homeRoutes.contains(routeName);
  }
}
