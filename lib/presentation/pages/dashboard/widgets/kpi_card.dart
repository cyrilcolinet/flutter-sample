import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KpiCard extends StatelessWidget {
  const KpiCard({
    this.key,
    required this.value,
    required this.text,
  }) : super(key: key);

  final Key? key;
  final Widget value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.0,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              value,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodyText1!.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
