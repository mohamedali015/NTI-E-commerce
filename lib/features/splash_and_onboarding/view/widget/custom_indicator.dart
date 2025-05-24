import 'package:flutter/material.dart';

import '../../../../core/helper/my_responsive.dart';
import '../../../../core/utils/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  final bool isActive;

  const CustomIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 250,
      ),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.midNightBlue
            : AppColors.midNightBlue.withAlpha(51),
        borderRadius: BorderRadius.circular(100),
      ),
      width: isActive
          ? MyResponsive.width(context, value: 40)
          : MyResponsive.width(context, value: 10),
      height: MyResponsive.height(context, value: 10),
    );
  }
}
