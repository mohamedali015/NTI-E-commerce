import 'package:flutter/material.dart';

abstract class MyResponsive {
  static double height(context, {required double value}) =>
      MediaQuery.of(context).size.height * (value / 1000);

  static double width(context, {required double value}) =>
      MediaQuery.of(context).size.width * (value / 375);

  static double fontSize(context, {required double value}) =>
      MediaQuery.of(context).size.width * (value / 375);

  static EdgeInsets paddingSymmetric(
    context, {
    required double horizontal,
    required double vertical,
  }) {
    return EdgeInsets.symmetric(
      horizontal: width(context, value: horizontal),
      vertical: height(context, value: vertical),
    );
  }
}
