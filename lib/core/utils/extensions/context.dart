import 'package:kunke_naturals_admin_app/core/error/exception.dart';
import 'package:kunke_naturals_admin_app/core/utils/router.dart';
import "package:flutter/material.dart";
import 'package:kunke_naturals_admin_app/core/widgets/in_app_notification.dart';

extension ContextExtension on BuildContext {
  double getHeight([double factor = 1]) {
    assert(factor != 0);
    return MediaQuery.of(this).size.height * factor;
  }

  double getWidth([double factor = 1]) {
    assert(factor != 0);
    return MediaQuery.of(this).size.width * factor;
  }

  double get height => getHeight();
  double get width => getWidth();

  TextTheme get textTheme => Theme.of(this).textTheme;

  Future<T?> push<T>(Widget page) => Navigator.push<T>(
        this,
        PageRouter.transitTo(
          () => page,
          "/${page.runtimeType.toString()}",
        ),
      );

  Future<T?> replace<T>(Widget page) => Navigator.pushReplacement(
        this,
        PageRouter.transitTo(
          () => page,
          "/${page.runtimeType.toString()}",
        ),
      );

  Future<T?> pushOff<T>(Widget page) => Navigator.pushAndRemoveUntil<T>(
        this,
        PageRouter.transitTo(
          () => page,
          "/${page.runtimeType.toString()}",
        ),
        (_) => false,
      );

  void popOff([String? routeTag]) => Navigator.popUntil(
      this, ModalRoute.withName(routeTag ?? '/AppScaffoldPage'));

  Future<bool> pop<T>([T? result]) => Navigator.maybePop(this, result);

  void showInAppNotification(
    String msg, {
    InAppNotificationType type = InAppNotificationType.error,
    int duration = 3,
  }) {
    switch (type) {
      case InAppNotificationType.success:
        break;
      case InAppNotificationType.info:
        break;
      case InAppNotificationType.error:
        break;
      default:
        throw InvalidArgOrDataException("Unknown InAppNotificationType");
    }
  }
  // Money money() => Money(currency());
}

extension WidgetExtension on Widget {
  Widget onTap(VoidCallback action, {bool opaque = true}) {
    return GestureDetector(
      behavior: opaque ? HitTestBehavior.opaque : HitTestBehavior.deferToChild,
      onTap: action,
      child: this,
    );
  }
}
