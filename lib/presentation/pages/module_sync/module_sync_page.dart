import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/module_sync/module_sync_controller.dart';
import 'package:wattway_by_colas/presentation/core/utils/assets_utils.dart';
import 'package:wattway_by_colas/presentation/pages/module_sync/widgets/module_sync_empty_list.dart';
import 'package:wattway_by_colas/presentation/pages/module_sync/widgets/module_sync_list.dart';
import 'package:wattway_by_colas/presentation/pages/module_sync/widgets/module_sync_list_shimmer.dart';
import 'package:wattway_by_colas/presentation/shared/auth_layout.dart';
import 'package:wattway_by_colas/presentation/shared/auth_title_subtitle.dart';

class ModuleSyncPage extends GetView<ModuleSyncController> {
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 100),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    FadeIn(
                      child: SvgPicture.asset(
                        AssetsUtils.svg('logo_block_2'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Obx(
                        () => AuthTitleSubtitle(
                          title: !controller.isLoading.value && controller.scanResults.isNotEmpty
                              ? 'module_sync_title'.tr
                              : 'module_searching_title'.tr,
                          subtitle: 'module_sync_subtitle'.tr,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => Visibility(
                        visible: !controller.isLoading.value,
                        child: Visibility(
                          visible: controller.scanResults.isNotEmpty,
                          child: ModuleSyncList(),
                          replacement: ModuleSyncEmptyList(),
                        ),
                        replacement: ModuleSyncListShimmer(),
                      ),
                    ),
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
