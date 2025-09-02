import 'package:flutter/material.dart';

import '../helper/my_responsive.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static TextStyle Regular_W400_10(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 10),
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle Regular_W400_12(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 12),
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle Regular_W400_14(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 14),
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle Medium_W500_12(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 12),
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle Medium_W500_16(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 16),
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle Medium_W500_18(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 18),
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle SemiBold_W600_12(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 12),
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle SemiBold_W600_14(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 14),
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle SemiBold_W600_18(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 18),
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle SemiBold_W600_20(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 20),
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle SemiBold_W600_23(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 23),
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle SemiBold_W600_34(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 34),
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle Bold_W700_20(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 20),
        fontWeight: FontWeight.w700,
        color: color,
      );

  static TextStyle Bold_W700_36(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 36),
        fontWeight: FontWeight.w700,
        color: color,
      );

  static TextStyle ExtraBold_W800_24(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 24),
        fontWeight: FontWeight.w800,
        color: color,
      );
}
