import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    this.key,
    required this.animationController,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final Key? key;
  final AnimationController animationController;
  final int index;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: [
        Icons.home,
        Icons.bar_chart,
        Icons.settings,
        Icons.file_download,
      ],
      elevation: 10,
      splashColor: const Color(primaryColor),
      activeColor: const Color(primaryColor),
      inactiveColor: const Color(greyColor),
      notchAndCornersAnimation: animationController,
      iconSize: 35,
      activeIndex: index,
      gapLocation: GapLocation.none,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: (int index) => onTap(index),
    );
  }
}
