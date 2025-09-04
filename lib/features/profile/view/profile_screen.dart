import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/my_responsive.dart';
import 'package:nti_ecommerce/core/translations/translation_keys.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_style.dart';
import 'package:nti_ecommerce/features/profile/manager/user_cubit/user_cubit.dart';
import 'package:nti_ecommerce/features/profile/view/my_favorites_screen.dart';
import 'package:nti_ecommerce/features/profile/view/my_orders_screen.dart';
import 'package:nti_ecommerce/features/profile/view/my_profile_screen.dart';
import 'package:nti_ecommerce/features/profile/view/settings_screen.dart';
import 'package:nti_ecommerce/features/profile/view/widgets/profile_image_widget.dart';
import 'package:nti_ecommerce/features/profile/view/widgets/profile_row_widget.dart';

import '../../../core/shared_widgets/app_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MyResponsive.paddingSymmetric(context, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileImageWidget(
              imagePath: UserCubit.get(context).userModel.imagePath,
            ),
            SizedBox(height: MyResponsive.height(context, value: 20)),
            Text(
              UserCubit.get(context).userModel.name ?? 'User Full Name',
              style: AppTextStyles.SemiBold_W600_18(context,
                  color: AppColors.primary),
            ),
            SizedBox(height: MyResponsive.height(context, value: 56)),
            ProfileRowWidget(
              title: TranslationKeys.myProfile.tr,
              imagePath: AppAssets.profilePerson,
              goTo: MyProfileScreen(),
            ),
            SizedBox(height: MyResponsive.height(context, value: 38)),
            ProfileRowWidget(
              title: TranslationKeys.myOrders.tr,
              imagePath: AppAssets.profileShopping,
              goTo: MyOrdersScreen(),
            ),
            SizedBox(height: MyResponsive.height(context, value: 38)),
            ProfileRowWidget(
              title: TranslationKeys.myFavorites.tr,
              imagePath: AppAssets.profileFavorite,
              goTo: MyFavoritesScreen(),
            ),
            SizedBox(height: MyResponsive.height(context, value: 38)),
            ProfileRowWidget(
              title: TranslationKeys.settings.tr,
              imagePath: AppAssets.profileSettings,
              goTo: SettingsScreen(),
            ),
            SizedBox(height: MyResponsive.height(context, value: 58)),
            Divider(
              color: AppColors.primary,
              thickness: 1,
            ),
            SizedBox(height: MyResponsive.height(context, value: 42)),
            InkWell(
              onTap: UserCubit.get(context).logout,
              child: Row(
                children: [
                  AppSvg(path: AppAssets.profileLogout),
                  SizedBox(width: MyResponsive.width(context, value: 20)),
                  Text(
                    TranslationKeys.logout.tr,
                    style: AppTextStyles.Medium_W500_18(context),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
