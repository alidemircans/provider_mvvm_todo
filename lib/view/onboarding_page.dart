import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/helper/app_localization.dart';
import 'package:todo/view_model/app_language_view_model.dart';
import 'package:todo/widget/text_fonts_generator.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppLanguage>(
      builder: (context, viewModel, child) => Scaffold(
        body: Center(
          child: InkWell(
            onTap: () {},
            child: TextStyleGenerator(
              text: "WELCOME PAGE",
              color: Colors.black,
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
