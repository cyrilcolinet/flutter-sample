import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/setting/setting_controller.dart';
import 'package:wattway_by_colas/domain/setting/models/settings_values.dart';
import 'package:wattway_by_colas/presentation/pages/setting/widgets/setting_app_bar.dart';
import 'package:wattway_by_colas/presentation/pages/setting/widgets/setting_cards.dart';

class SettingPage extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: settingsValues.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: SettingAppBar(),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 15,
                    right: 15,
                  ),
                  child: SettingCards(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
