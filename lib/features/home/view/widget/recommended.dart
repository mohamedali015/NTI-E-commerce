import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/core/helper/my_responsive.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_style.dart';
import 'package:nti_ecommerce/features/home/manager/best_seller_cubit/best_seller_cubit.dart';

import '../../manager/best_seller_cubit/best_seller_state.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BestSellerCubit()..getBestSeller(),
      child: Builder(builder: (context) {
        return BlocBuilder<BestSellerCubit, BestSellerState>(
          builder: (context, state) {
            if (state is BestSellerLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            } else if (state is BestSellerError) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              );
            } else if (state is BestSellerSuccess) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 160 / 350,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.bestSellers.length,
                itemBuilder: (context, index) {
                  final item = state.bestSellers[index];
                  return Card(
                    color: AppColors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(item.imagePath,
                                fit: BoxFit.fill)),
                        SizedBox(
                          height: MyResponsive.height(context, value: 8),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.name,
                            style: AppTextStyles.Medium_W500_16(context),
                          ),
                        ),
                        SizedBox(
                          height: MyResponsive.height(context, value: 4),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.description,
                            style: AppTextStyles.Regular_W400_10(context)
                                .copyWith(color: AppColors.black),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: MyResponsive.height(context, value: 8),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${item.price} EGP",
                            style: AppTextStyles.Medium_W500_12(context)
                                .copyWith(color: AppColors.black),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return SizedBox();
          },
        );
      }),
    );
  }
}
