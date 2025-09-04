import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/helper/my_responsive.dart';
import 'package:nti_ecommerce/core/shared_widgets/cached_network_image_wrapper.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';

class ProfileImageWidget extends StatelessWidget {
  String? imagePath;
  double? width;
  double? height;

  ProfileImageWidget({
    super.key,
    this.imagePath,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MyResponsive.width(context, value: 50),
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: imagePath != null
            ? CachedNetworkImageWrapper(
                imagePath: imagePath!,
                width: width,
                height: height,
                fit: BoxFit.cover,
              )
            : Image.asset(AppAssets.profileImage, fit: BoxFit.cover),
      ),
    );
  }
}
