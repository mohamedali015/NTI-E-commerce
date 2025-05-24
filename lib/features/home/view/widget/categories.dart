import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/core/helper/my_responsive.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/features/home/manager/category_cubit/category_cubit.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../manager/category_cubit/category_state.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getCategories(),
      child: Builder(builder: (context) {
        return BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            } else if (state is CategoryError) {
              return Center(
                child: Text(
                  state.error,
                  style: AppTextStyles.Regular_W400_14(context)
                      .copyWith(color: AppColors.red),
                ),
              );
            } else if (state is CategorySuccess) {
              return SizedBox(
                height: MyResponsive.height(context, value: 125),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsetsDirectional.only(end: 15),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: MyResponsive.width(context, value: 40),
                                backgroundImage:
                                    state.categories[index].imagePath != null
                                        ? NetworkImage(
                                            state.categories[index].imagePath!)
                                        : AssetImage(AppAssets.logo)
                                            as ImageProvider,
                                backgroundColor: Colors.transparent,
                              ),
                              SizedBox(
                                height: MyResponsive.height(context, value: 5),
                              ),
                              Text(
                                state.categories[index].title ?? "",
                                style: AppTextStyles.Regular_W400_10(context)
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }

            return Center(
              child: Text(
                "No categories available",
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
