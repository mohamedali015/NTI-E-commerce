import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/cache/cache_data.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/cache/cache_key.dart';
import '../../../../core/helper/my_navigator.dart';
import '../../../../core/translations/translation_keys.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../auth/view/get_started_screen.dart';
import '../../view/widget/custom_page.dart';
import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  final PageController pageController = PageController();

  List<Widget> pages = [
    CustomPage(
      title: TranslationKeys.chooseProducts.tr,
      description: TranslationKeys.chooseProductsDesc.tr,
      imagePath: AppAssets.chooseProducts,
    ),
    CustomPage(
      title: TranslationKeys.makePayment.tr,
      description: TranslationKeys.makePaymentDesc.tr,
      imagePath: AppAssets.makePayment,
    ),
    CustomPage(
      title: TranslationKeys.getYourOrder.tr,
      description: TranslationKeys.getYourOrderDesc.tr,
      imagePath: AppAssets.getYourOrder,
    ),
  ];

  void changePage(int index) {
    currentIndex = index;
    emit(OnBoardingChangePageState());
  }

  void nextPage() {
    currentIndex++;
    pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 250),
      curve: Curves.linear,
    );
    emit(OnBoardingChangePageState());
  }

  void prevPage() {
    if (currentIndex > 0) {
      currentIndex--;
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 250),
        curve: Curves.linear,
      );
      emit(OnBoardingChangePageState());
    }
  }

  void skip() {
    CacheHelper.saveData(key: CacheKeys.firstTime, value: true);
    CacheData.firstTime = true;

    // navigate to get started screen
    MyNavigator.goTo(
      screen: GetStartedScreen(),
      isReplace: true,
    );
  }
}
