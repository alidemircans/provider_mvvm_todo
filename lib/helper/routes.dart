import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view/home_screen_view.dart';
import 'package:todo/view/onboarding_page.dart';
import 'package:todo/view/splah_screen_view.dart';
import 'package:todo/view_model/home_screen_view_model.dart';
import 'package:todo/view_model/splash_screen_view_model.dart';

class Routes {
  static const String SPLASH_PAGE = '/splash_page';
  static const String HOME_PAGE = '/home_page';
  static const String ONBOARDING_PAGE = '/onboarding_page';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      SPLASH_PAGE: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => SplashViewModel(),
            child: SplashScreen(),
          ),
      ONBOARDING_PAGE: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => SplashViewModel(),
            child: OnBoarding(),
          ),
      HOME_PAGE: (BuildContext context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
            ],
            child: HomeScreen(),
          ),
    };
  }
}
