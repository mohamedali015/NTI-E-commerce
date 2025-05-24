import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/helper/my_responsive.dart';
import 'package:nti_ecommerce/core/utils/app_text_style.dart';

import '../../../../core/translations/translation_keys.dart';
import '../../../../core/utils/app_colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MyResponsive.height(context, value: 55),
      padding:
          MyResponsive.paddingSymmetric(context, horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.white,
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: AppColors.lightGray,
              size: MyResponsive.width(context, value: 20),
            ),
            SizedBox(
              width: MyResponsive.width(context, value: 14),
            ),
            Text(
              TranslationKeys.searchHint,
              style: AppTextStyles.Regular_W400_14(context)
                  .copyWith(color: AppColors.lightGray),
            ),
          ],
        ),
      ),
    );
  }
}
