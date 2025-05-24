import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/helper/my_navigator.dart';
import 'package:nti_ecommerce/core/helper/my_responsive.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_elevated_button.dart';
import 'package:nti_ecommerce/features/auth/view/get_started_screen.dart';

import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_key.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MyResponsive.paddingSymmetric(context,
            horizontal: 24, vertical: 120),
        child: Column(
          children: [
            AppElevatedButton(
                buttonText: "Sign Out",
                onPressed: () async {
                  await CacheHelper.removeData(key: CacheKeys.accessToken);
                  await CacheHelper.removeData(key: CacheKeys.refreshToken);
                  MyNavigator.goTo(screen: GetStartedScreen(), isReplace: true);
                }),
          ],
        ),
      ),
    );
  }
}
