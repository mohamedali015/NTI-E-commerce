import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/helper/my_navigator.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_svg.dart';

import '../../../core/cache/cache_data.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_key.dart';
import '../../../core/utils/app_assets.dart';
import '../../auth/view/get_started_screen.dart';
import '../../home/view/AppHomeScreen.dart';
import '../../profile/manager/user_cubit/user_cubit.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppSvg(path: AppAssets.logo),
      ),
    );
  }

  void navigate(context) async {
    Future.delayed((Duration(milliseconds: 500)), () {
      // navigate to lets start view
      CacheData.firstTime = CacheHelper.getData(key: CacheKeys.firstTime);
      if (CacheData.firstTime != null) {
        // check is logged in
        CacheData.accessToken = CacheHelper.getData(key: CacheKeys.accessToken);
        if (CacheData.accessToken != null) {
          UserCubit.get(context).getUserData().then((bool result) {
            if (result) {
              MyNavigator.goTo(screen: AppHomeScreen(), isReplace: true);
            } else {
              MyNavigator.goTo(screen: GetStartedScreen(), isReplace: true);
            }
          });
        } else {
          // goto login
          MyNavigator.goTo(screen: GetStartedScreen(), isReplace: true);
        }
      } else {
        // first time
        MyNavigator.goTo(screen: OnBoardingScreen(), isReplace: true);
      }
    });
  }
}
