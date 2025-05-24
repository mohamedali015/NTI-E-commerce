import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/my_navigator.dart';
import 'package:nti_ecommerce/core/helper/my_responsive.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_elevated_button.dart';
import 'package:nti_ecommerce/core/utils/app_text_style.dart';
import 'package:nti_ecommerce/features/auth/view/register_screen.dart';

import '../../../core/translations/translation_keys.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import 'login_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.getStartedBackground),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withAlpha(200),
              ],
              stops: [0.3, 1.0],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: MyResponsive.paddingSymmetric(
              context,
              horizontal: 45,
              vertical: 35,
            ),
            child: Column(
              children: [
                Spacer(),
                Text(
                  TranslationKeys.title.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.SemiBold_W600_34(context)
                      .copyWith(color: AppColors.white),
                ),
                SizedBox(
                  height: MyResponsive.height(context, value: 24),
                ),
                Text(
                  TranslationKeys.description.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.Regular_W400_14(context)
                      .copyWith(color: AppColors.darkWhite),
                ),
                SizedBox(
                  height: MyResponsive.height(context, value: 24),
                ),
                AppElevatedButton(
                  buttonText: TranslationKeys.login.tr,
                  onPressed: () {
                    MyNavigator.goTo(screen: () => LoginScreen());
                  },
                ),
                SizedBox(
                  height: MyResponsive.height(context, value: 14),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: AppElevatedButton(
                    buttonText: TranslationKeys.register.tr,
                    backgroundColor: AppColors.white,
                    foregroundColor: AppColors.primary,
                    onPressed: () {
                      MyNavigator.goTo(
                        screen: () => RegisterScreen(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
