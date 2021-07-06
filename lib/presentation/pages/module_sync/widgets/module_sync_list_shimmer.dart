import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wattway_by_colas/presentation/core/utils/assets_utils.dart';

class ModuleSyncListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 3,
      child: FadeIn(
        child: LottieBuilder.asset(
          AssetsUtils.animation('no_signal'),
        ),
      ),
    );
  }
}
