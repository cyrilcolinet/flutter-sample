import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/home/home_controller.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';
import 'package:wattway_by_colas/presentation/pages/dashboard/dashboard_page.dart';
import 'package:wattway_by_colas/presentation/pages/home/widgets/bottom_bar_widget.dart';
import 'package:wattway_by_colas/presentation/pages/setting/setting_page.dart';
import 'package:wattway_by_colas/presentation/pages/statistics/statistics_page.dart';
import 'package:wattway_by_colas/presentation/shared/get_view_with_hook.dart';
import 'package:wattway_by_colas/presentation/shared/hooks/use_curve_animation.dart';

class HomePage extends GetViewWithHook<HomeController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    final AnimationController _controller = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final Animation<double> _animation = useCurve(_controller);

    return ObxValue(
      (RxBool displayFloating) => Scaffold(
        backgroundColor: const Color(fillColor),
        extendBody: true,
        floatingActionButton: controller.displayFloating.isTrue
            ? ScaleTransition(
                scale: _animation,
                child: FloatingActionButton(
                  backgroundColor: const Color(primaryColor),
                  onPressed: () => controller.floatingCallback(),
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: (int index) => controller.onPageChanged(index),
          children: <Widget>[
            DashboardPage(),
            StatisticPage(),
            SettingPage(),
            Container(color: const Color(fillColor)),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomBar(
            index: controller.index.value,
            animationController: _controller,
            onTap: (int index) => controller.onPageChanged(index),
          ),
        ),
      ),
      controller.displayFloating,
    );
  }
}
