import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/my_responsive.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_appbar.dart';
import 'package:nti_ecommerce/core/translations/translation_keys.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_style.dart';

import '../manager/user_cubit/user_cubit.dart';
import '../manager/user_cubit/user_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        final userCubit = UserCubit.get(context);

        return Scaffold(
          appBar: AppAppBar.appBar(
              context: context, title: TranslationKeys.settings.tr),
          body: SingleChildScrollView(
            child: Padding(
              padding: MyResponsive.paddingSymmetric(context, horizontal: 26),
              child: Column(
                children: [
                  SizedBox(
                    height: MyResponsive.height(context, value: 72),
                  ),
                  Row(
                    children: [
                      Text(
                        TranslationKeys.language.tr,
                        style: AppTextStyles.Medium_W500_18(context),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: userCubit.changeLanguage,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MyResponsive.width(context, value: 12),
                                vertical:
                                    MyResponsive.height(context, value: 6),
                              ),
                              decoration: BoxDecoration(
                                color: userCubit.isEnglish
                                    ? AppColors.pink
                                    : AppColors.primary,
                              ),
                              child: Text(
                                TranslationKeys.ar.tr,
                                style: AppTextStyles.Medium_W500_20(context,
                                    color: userCubit.isEnglish
                                        ? AppColors.black
                                        : AppColors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MyResponsive.width(context, value: 12),
                                vertical:
                                    MyResponsive.height(context, value: 6),
                              ),
                              decoration: BoxDecoration(
                                color: userCubit.isEnglish
                                    ? AppColors.primary
                                    : AppColors.pink,
                              ),
                              child: Text(
                                TranslationKeys.en.tr,
                                style: AppTextStyles.Medium_W500_20(context,
                                    color: userCubit.isEnglish
                                        ? AppColors.white
                                        : AppColors.black),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}