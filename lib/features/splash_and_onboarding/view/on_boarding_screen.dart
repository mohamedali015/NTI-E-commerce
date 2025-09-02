import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/cache/cache_data.dart';
import 'package:nti_ecommerce/core/cache/cache_key.dart';
import 'package:nti_ecommerce/core/helper/my_navigator.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_style.dart';
import 'package:nti_ecommerce/features/splash_and_onboarding/view/widget/app_text_button.dart';

import '../../../core/cache/cache_helper.dart';
import '../../../core/helper/my_responsive.dart';
import '../../../core/translations/translation_keys.dart';
import '../../auth/view/get_started_screen.dart';
import '../manager/cubit/on_boarding_cubit.dart';
import '../manager/cubit/on_boarding_state.dart';
import 'widget/custom_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: Builder(builder: (context) {
          OnBoardingCubit onBoardingCubit = OnBoardingCubit.get(context);
          return BlocConsumer<OnBoardingCubit, OnBoardingState>(
              listener: (context, state) {
            if (onBoardingCubit.currentIndex == onBoardingCubit.pages.length) {
              // save first time to cache
              CacheHelper.saveData(key: CacheKeys.firstTime, value: true);
              CacheData.firstTime = true;

              // navigate to get started screen
              MyNavigator.goTo(
                screen: GetStartedScreen(),
                isReplace: true,
              );
            }
          }, builder: (context, state) {
            return Padding(
              padding: MyResponsive.paddingSymmetric(context,
                  horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: MyResponsive.height(context, value: 50),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      onBoardingCubit.currentIndex ==
                              onBoardingCubit.pages.length - 1
                          ? SizedBox(
                              height: MyResponsive.height(context, value: 30))
                          : AppTextButton(
                              text: TranslationKeys.skip.tr,
                              textStyle: AppTextStyles.SemiBold_W600_18(
                                context,
                              ),
                              onPressed: onBoardingCubit.skip,
                            ),
                    ],
                  ),
                  Expanded(
                    child: PageView(
                      onPageChanged: onBoardingCubit.changePage,
                      controller: onBoardingCubit.pageController,
                      children: onBoardingCubit.pages,
                    ),
                  ),
                  Row(
                    children: [
                      onBoardingCubit.currentIndex == 0
                          ? SizedBox(
                              width: MyResponsive.width(context, value: 50))
                          : AppTextButton(
                              text: TranslationKeys.prev.tr,
                              textStyle: AppTextStyles.SemiBold_W600_18(context,
                                  color: AppColors.lightGray),
                              onPressed: onBoardingCubit.prevPage,
                            ),
                      Spacer(),
                      Row(
                        children: [
                          CustomIndicator(
                              isActive: onBoardingCubit.currentIndex == 0),
                          SizedBox(
                              width: MyResponsive.width(context, value: 5)),
                          CustomIndicator(
                              isActive: onBoardingCubit.currentIndex == 1),
                          SizedBox(
                              width: MyResponsive.width(context, value: 5)),
                          CustomIndicator(
                              isActive: onBoardingCubit.currentIndex == 2),
                        ],
                      ),
                      Spacer(),
                      AppTextButton(
                        text: onBoardingCubit.currentIndex ==
                                onBoardingCubit.pages.length - 1
                            ? TranslationKeys.getStarted.tr
                            : TranslationKeys.next.tr,
                        textStyle: AppTextStyles.SemiBold_W600_18(context,
                            color: AppColors.primary),
                        onPressed: onBoardingCubit.nextPage,
                      ),
                    ],
                  )
                ],
              ),
            );
          });
        }),
      ),
    );
  }
}
