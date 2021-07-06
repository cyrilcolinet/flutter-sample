import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:wattway_by_colas/presentation/pages/dashboard/widgets/kpi_card.dart';
import 'package:wattway_by_colas/presentation/shared/kpi.dart';

class KpiHorizontalList extends StatelessWidget {
  const KpiHorizontalList({
    this.key,
    required this.kpis,
  }) : super(key: key);

  final Key? key;
  final List<Kpi> kpis;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: kpis
            .map(
              (Kpi kpi) => FadeInLeft(
                duration: Duration(milliseconds: kpis.indexOf(kpi) * 300),
                child: KpiCard(
                  value: kpi.value,
                  text: kpi.label,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
