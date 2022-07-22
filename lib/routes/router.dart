import 'package:alvoiz/view/presentation/home/view/home_page.dart';
import 'package:alvoiz/view/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static final RouterGenerator _generator = RouterGenerator._init();
  static RouterGenerator get router => _generator;

  RouterGenerator._init();

  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return navigate(SplashScreen());
      case '/':
        return navigate(HomePage());
    }
    return null;
  }

  navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
