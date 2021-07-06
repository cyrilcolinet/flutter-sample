import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/dashboard/dashboard_controller.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';
import 'package:wattway_by_colas/presentation/pages/dashboard/widgets/alerts_list.dart';
import 'package:wattway_by_colas/presentation/pages/dashboard/widgets/dashboard_app_bar.dart';
import 'package:wattway_by_colas/presentation/pages/dashboard/widgets/kpi_horizontal_list.dart';
import 'package:wattway_by_colas/presentation/pages/dashboard/widgets/module_connectivity_status.dart';
import 'package:wattway_by_colas/presentation/shared/kpi.dart';

class DashboardPage extends GetView<DashboardController> {
  List<Kpi> get kpi {
    final List<Kpi> kpi = <Kpi>[];
    kpi.add(Kpi(
      label: 'commande sortie 12V',
      value: Icon(Icons.check, color: Color(successColor), size: 30),
    ));
    kpi.add(Kpi(
      label: 'commande sortie 5V',
      value: Icon(Icons.close, color: Color(errorColor), size: 30),
    ));
    kpi.add(Kpi(
      label: 'état cmd. PWM',
      value: Container(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          '80%',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    ));
    return kpi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAppBar(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  children: [
                    KpiHorizontalList(kpis: kpi),
                    const SizedBox(height: 20),
                    AlertsList(),
                    const SizedBox(height: 20),
                    ModuleConnectivityStatus()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
