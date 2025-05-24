import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/core/helper/my_responsive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../manager/slider_cubit/slider_cubit.dart';
import '../../manager/slider_cubit/slider_state.dart';

class AppSlider extends StatelessWidget {
  const AppSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SliderCubit()..getSliders(),
      child: Builder(builder: (context) {
        SliderCubit sliderCubit = SliderCubit.get(context);
        return BlocBuilder<SliderCubit, SliderState>(
          builder: (context, state) {
            if (state is SliderLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            } else if (state is SliderError) {
              return Center(
                child: Text(
                  state.error,
                  style: AppTextStyles.Regular_W400_14(context)
                      .copyWith(color: AppColors.red),
                ),
              );
            } else if (state is SliderSuccess) {
              return Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MyResponsive.height(context, value: 200),
                      autoPlay: true,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        // Handle page change if needed
                        sliderCubit.changeIndex(index);
                      },
                    ),
                    items: sliderCubit.slidersList.map((slider) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                              horizontal: MyResponsive.width(context, value: 5),
                            ),
                            padding: MyResponsive.paddingSymmetric(context,
                                horizontal: 14, vertical: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(slider.imagePath ?? ""),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  slider.title ?? "",
                                  style: AppTextStyles.Bold_W700_20(context)
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(
                                  height:
                                      MyResponsive.height(context, value: 10),
                                ),
                                Text(
                                  slider.description ?? "",
                                  style: AppTextStyles.Regular_W400_12(context)
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(
                                  height:
                                      MyResponsive.height(context, value: 10),
                                ),
                                Container(
                                  padding: MyResponsive.paddingSymmetric(
                                      context,
                                      horizontal: 8,
                                      vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: AppColors.white,
                                        width: 1,
                                      )),
                                  child: Text(
                                    "Shop Now",
                                    style:
                                        AppTextStyles.SemiBold_W600_12(context)
                                            .copyWith(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: MyResponsive.height(context, value: 15),
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: state.currentIndex,
                    count: sliderCubit.slidersList.length,
                    effect: WormEffect(
                      dotHeight: MyResponsive.height(context, value: 10),
                      dotWidth: MyResponsive.width(context, value: 10),
                      activeDotColor: AppColors.primary,
                      dotColor: AppColors.midNightBlue.withAlpha(51),
                    ),
                  ),
                ],
              );
            }

            return Center(
              child: Text(
                "No Sliders available",
                style: AppTextStyles.Regular_W400_14(context)
                    .copyWith(color: AppColors.red),
              ),
            );
          },
        );
      }),
    );
  }
}
