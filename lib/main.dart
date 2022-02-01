import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:todo/helper/app_localization.dart';
import 'package:todo/helper/color_helper.dart';
import 'package:todo/helper/locator.dart';
import 'package:todo/helper/routes.dart';
import 'package:todo/view/splah_screen_view.dart';
import 'package:todo/view_model/app_language_view_model.dart';
import 'package:todo/view_model/splash_screen_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  runApp(
    MainClass(),
  );
}

class MainClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black, statusBarBrightness: Brightness.dark));
    return ChangeNotifierProvider(
        create: (context) => AppLanguage(),
        child: Consumer<AppLanguage>(builder: (context, viewModel, child) {
          return MaterialApp(
            locale: viewModel.appLocal,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate
            ],
            supportedLocales: [
              Locale('en', 'EN'),
              Locale('tr', 'TR'),
            ],
            title: "Todo",
            theme: ThemeData(
              fontFamily: 'Montserrat',
              primarySwatch: ColorHelper.primarySwatch,
              accentColor: ColorHelper.accentColor,
              appBarTheme: AppBarTheme(brightness: Brightness.dark),
            ),
            home: ChangeNotifierProvider(
              create: (context) => SplashViewModel(),
              child: SplashScreen(),
            ),
            routes: Routes.getRoutes(),
          );
        }));
  }
}
