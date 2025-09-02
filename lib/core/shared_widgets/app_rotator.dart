import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/cache/cache_data.dart';
import 'package:nti_ecommerce/core/cache/cache_key.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_svg.dart';

class MyRotator extends StatelessWidget {
  const MyRotator({super.key, required this.icon, this.isEn = false});

  final String icon;
  final bool isEn;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: CacheData.lang == CacheKeys.keyAR
          ? (isEn ? math.pi : 0)
          : (isEn ? 0 : math.pi),
      child: AppSvg(path: icon),
    );
  }
}
