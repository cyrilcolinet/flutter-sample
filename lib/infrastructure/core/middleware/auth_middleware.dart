import 'package:flutter/widgets.dart';
import 'package:flutter_sample_seed/presentation/core/utils/logger_utils.dart';
import 'package:flutter_sample_seed/presentation/routes/app_pages.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int get priority => 10;

  @override
  RouteSettings? redirect(String? route) {
    final bool isAuth = true;
    return isAuth ? null : RouteSettings(name: Routes.signin);
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    return bindings;
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    Logger.write("$runtimeType bindings ready");
    return page;
  }
}
