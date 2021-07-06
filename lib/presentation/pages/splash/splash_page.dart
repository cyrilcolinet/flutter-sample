import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample_seed/application/splash_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_sample_seed/presentation/core/theme/app_colors.dart';
import 'package:flutter_sample_seed/presentation/core/utils/assets_utils.dart';
import 'package:flutter_sample_seed/presentation/shared/get_view_with_hook.dart';

class SplashPage extends GetViewWithHook<SplashController> {
  @override
  Widget build(BuildContext context) {
    //final PackageInfo packageInfo = useGetPackageInfo();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Container(
      color: Color(primaryColor),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            color: Color(primaryColor),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    transform: Matrix4.translationValues(50.0, -120.0, 0.0),
                    child: SvgPicture.asset(
                      AssetsUtils.svg('top_background_logos'),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    transform: Matrix4.translationValues(-50.0, 120.0, 0.0),
                    child: SvgPicture.asset(
                      AssetsUtils.svg('bottom_background_logos'),
                    ),
                  ),
                ),
                Align(
                  child: FadeIn(
                    child: SvgPicture.asset(
                      AssetsUtils.svg('logo_splash'),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 40),
                    child: Text(
                      'v1.2.3',
                      style: Get.textTheme.headline2!.copyWith(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
