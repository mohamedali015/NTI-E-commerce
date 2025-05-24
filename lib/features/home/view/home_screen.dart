import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/helper/my_responsive.dart';
import 'package:nti_ecommerce/core/translations/translation_keys.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_style.dart';
import 'package:nti_ecommerce/features/home/view/widget/categories.dart';
import 'package:nti_ecommerce/features/home/view/widget/recommended.dart';
import 'package:nti_ecommerce/features/home/view/widget/slider.dart';

import '../../../core/shared_widgets/app_svg.dart';
import 'widget/search_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          print("// Implement your refresh logic here");
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: MyResponsive.paddingSymmetric(context,
                horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MyResponsive.height(context, value: 55),
                ),
                SizedBox(
                  width: double.infinity,
                  child: AppSvg(
                    path: AppAssets.logo,
                    width: MyResponsive.width(context, value: 130),
                    height: MyResponsive.height(context, value: 45),
                  ),
                ),
                SizedBox(
                  height: MyResponsive.height(context, value: 30),
                ),
                SearchBox(),
                SizedBox(
                  height: MyResponsive.height(context, value: 15),
                ),
                Text(
                  TranslationKeys.allFeatured,
                  style: AppTextStyles.SemiBold_W600_18(context)
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: MyResponsive.height(context, value: 25),
                ),
                Categories(),
                SizedBox(
                  height: MyResponsive.height(context, value: 25),
                ),
                AppSlider(),
                SizedBox(
                  height: MyResponsive.height(context, value: 30),
                ),
                Text(
                  TranslationKeys.recommended,
                  style: AppTextStyles.SemiBold_W600_18(context)
                      .copyWith(color: AppColors.black),
                ),
                SizedBox(
                  height: MyResponsive.height(context, value: 18),
                ),
                Recommended(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
