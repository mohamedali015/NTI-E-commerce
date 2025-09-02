import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_rotator.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';
import 'package:nti_ecommerce/core/utils/app_text_style.dart';

class AppAppBar {
  static AppBar appBar({required BuildContext context, String? title}) {
    return AppBar(
      title: Text(title ?? ''),
      titleTextStyle: AppTextStyles.SemiBold_W600_18(context),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: MyRotator(icon: AppAssets.forwardArrow),
      ),
    );
  }
}
