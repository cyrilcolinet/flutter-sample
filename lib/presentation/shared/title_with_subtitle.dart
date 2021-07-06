import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleWithSubtitle extends StatelessWidget {
  TitleWithSubtitle({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 0),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Text(
        subtitle,
        style: Get.textTheme.headline2,
      ),
    );
  }
}
