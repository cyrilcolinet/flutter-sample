import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_sample_seed/presentation/core/theme/app_colors.dart';

class AuthTitleRedirect extends StatelessWidget {
  AuthTitleRedirect({
    required this.title,
    required this.buttonLabel,
    required this.onTap,
  });

  final String title;
  final String buttonLabel;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    title,
                    style: Get.textTheme.subtitle1,
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () => onTap(),
                    child: Text(
                      buttonLabel,
                      style: Get.textTheme.headline2!.copyWith(
                        color: const Color(primaryColor),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
