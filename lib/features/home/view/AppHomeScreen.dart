import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/helper/my_responsive.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_svg.dart';
import 'package:nti_ecommerce/core/translations/translation_keys.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';

import '../../items/view/items_screen.dart';
import '../../profile/view/profile_screen.dart';
import 'home_screen.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  int currentIndex = 0;
  PageController pageController = PageController();

  List<Widget> screens = [
    // Add your screens here
    HomeScreen(),
    ItemsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          currentIndex = index;
          setState(() {});
        },
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
            );
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: AppSvg(
              path: AppAssets.home,
              color: currentIndex == 0 ? AppColors.primary : AppColors.black,
            ),
            label: TranslationKeys.home,
          ),
          BottomNavigationBarItem(
            icon: AppSvg(
              path: AppAssets.items,
              color: currentIndex == 1 ? AppColors.primary : AppColors.black,
            ),
            label: TranslationKeys.items,
          ),
          BottomNavigationBarItem(
            icon: AppSvg(
              path: AppAssets.person,
              color: currentIndex == 2 ? AppColors.primary : AppColors.black,
            ),
            label: TranslationKeys.person,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the action for the floating action button
        },
        child: AppSvg(path: AppAssets.shopping),
      ),
    );
  }
}
