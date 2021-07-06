import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:wattway_by_colas/presentation/core/bindings/app_bindings.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_light_theme.dart';
import 'package:wattway_by_colas/presentation/core/translations/app_translations.dart';
import 'package:wattway_by_colas/presentation/core/utils/logger_utils.dart';
import 'package:wattway_by_colas/presentation/routes/app_pages.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return GetMaterialApp(
      title: 'wattway_by_colas',
      theme: lightTheme,
      initialBinding: AppBindings(),
      enableLog: true,
      logWriterCallback: Logger.write,
      debugShowCheckedModeBanner: false,
      color: const Color(accentColor),
      locale: const Locale('fr', 'FR'),
      fallbackLocale: const Locale('fr', 'FR'),
      translationsKeys: AppTranslation.translations,
      navigatorKey: Get.key,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
