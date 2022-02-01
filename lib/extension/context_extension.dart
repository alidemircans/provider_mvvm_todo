import 'package:flutter/material.dart';
import 'package:todo/helper/app_localization.dart';

extension ContextExtention on BuildContext {
  double getDynmaicHeight(double val) => MediaQuery.of(this).size.height * val;
  double getDynmaicWidth(double val) => MediaQuery.of(this).size.width * val;
  AppLocalizations? get strings => AppLocalizations.of(this);
}


