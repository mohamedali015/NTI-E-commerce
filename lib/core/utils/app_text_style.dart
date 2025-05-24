import 'package:flutter/material.dart';

import '../helper/my_responsive.dart';

abstract class AppTextStyles {
  static TextStyle Regular_W400_10(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 10),
        fontWeight: FontWeight.w400,
      );

  static TextStyle Regular_W400_12(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 12),
        fontWeight: FontWeight.w400,
      );

  static TextStyle Regular_W400_14(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 14),
        fontWeight: FontWeight.w400,
      );

  static TextStyle Medium_W500_12(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 12),
        fontWeight: FontWeight.w500,
      );

  static TextStyle Medium_W500_16(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 16),
        fontWeight: FontWeight.w500,
      );

  static TextStyle SemiBold_W600_12(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 12),
        fontWeight: FontWeight.w600,
      );

  static TextStyle SemiBold_W600_14(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 14),
        fontWeight: FontWeight.w600,
      );

  static TextStyle SemiBold_W600_18(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 18),
        fontWeight: FontWeight.w600,
      );

  static TextStyle SemiBold_W600_23(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 23),
        fontWeight: FontWeight.w600,
      );

  static TextStyle SemiBold_W600_34(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 34),
        fontWeight: FontWeight.w600,
      );

  static TextStyle Bold_W700_20(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 20),
        fontWeight: FontWeight.w700,
      );

  static TextStyle Bold_W700_36(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 36),
        fontWeight: FontWeight.w700,
      );

  static TextStyle ExtraBold_W800_24(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 24),
        fontWeight: FontWeight.w800,
      );
}
