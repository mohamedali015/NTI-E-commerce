import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/helper/my_navigator.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_rotator.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_svg.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';
import 'package:nti_ecommerce/core/utils/app_text_style.dart';

import '../../../../core/helper/my_responsive.dart';

class ProfileRowWidget extends StatelessWidget {
  String title;
  String imagePath;

  Widget goTo;

  ProfileRowWidget({
    super.key,
    required this.title,
    required this.imagePath,
    required this.goTo,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => MyNavigator.goTo(screen: goTo),
      child: Row(
        children: [
          AppSvg(path: imagePath),
          SizedBox(width: MyResponsive.width(context, value: 20)),
          Text(
            title,
            style: AppTextStyles.Medium_W500_18(context),
          ),
          const Spacer(),
          MyRotator(
            icon: AppAssets.forwardArrow,
            isEn: true,
          ),
        ],
      ),
    );
  }
}
