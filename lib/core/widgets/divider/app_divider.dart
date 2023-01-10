import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final Color? color;

  const AppDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Insets.md),
      child: Divider(
        color: color ?? Colors.black,
      ),
    );
  }
}
