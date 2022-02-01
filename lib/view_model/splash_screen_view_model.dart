import 'package:flutter/material.dart';
import 'package:todo/helper/locator.dart';
import 'package:todo/helper/routes.dart';
import 'package:todo/helper/shared_preference_instance.dart';

enum CheckEnum { Checking, Error, Idle }

class SplashViewModel extends ChangeNotifier {
  CheckEnum checkEnum = CheckEnum.Idle;
  SharedPreferencesInstance prefs = locator.get<SharedPreferencesInstance>();

  checkIsFirstOpening(context) async {
    try {
      String? opened = await prefs.getString("opened");
      if (opened == null) {
        await prefs.setString("opened", "true");
        openOnBoardingPage(context);
      } else {
        openHomePage(context);
      }
    } catch (e) {
      checkEnum = CheckEnum.Error;
      print("SplashViewModel / checkIsFirstOpening $e");
    }
  }

  openHomePage(context) {
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.HOME_PAGE, (Route<dynamic> route) => false);
  }

  openOnBoardingPage(context) {
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.ONBOARDING_PAGE, (Route<dynamic> route) => false);
  }
}
