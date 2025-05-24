import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/helper/my_responsive.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_svg.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_style.dart';

class CustomPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const CustomPage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MyResponsive.height(context, value: 140),
          ),
          AppSvg(
            path: imagePath,
          ),
          SizedBox(
            height: MyResponsive.height(context, value: 34),
          ),
          Text(
            title,
            style: AppTextStyles.ExtraBold_W800_24(context)
                .copyWith(color: AppColors.black),
          ),
          SizedBox(
            height: MyResponsive.height(context, value: 10),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextStyles.SemiBold_W600_14(context)
                .copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
