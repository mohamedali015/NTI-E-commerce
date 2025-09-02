import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/helper/my_responsive.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';

class ProfileImageWidget extends StatelessWidget {
  Image? image;

  ProfileImageWidget({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MyResponsive.width(context, value: 50),
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: image ?? Image.asset(AppAssets.profileImage, fit: BoxFit.cover),
      ),
    );
  }
}
