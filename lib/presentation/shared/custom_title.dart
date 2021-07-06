import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitle extends StatelessWidget {
  CustomTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Get.textTheme.headline1!.copyWith(fontSize: 22),
    );
  }
}
