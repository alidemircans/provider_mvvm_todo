import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_model/app_language_view_model.dart';
import 'package:todo/view_model/splash_screen_view_model.dart';
import 'package:todo/widget/text_fonts_generator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashViewModel>(context).checkIsFirstOpening(context);

    return Consumer<AppLanguage>(
      builder: (context, viewModel, child) => Scaffold(
        body: Center(
          child: InkWell(
            onTap: () {},
            child: TextStyleGenerator(
              text: "LOGO",
              color: Colors.black,
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
