import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';

class DrawerItems extends StatelessWidget {
  final String icon, text;
  final VoidCallback? action;
  final Widget? route;
  final TextStyle? style;

  const DrawerItems({
    Key? key,
    required this.icon,
    required this.text,
    this.action,
    this.route,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(Insets.sm),
        child: InkWell(
          onTap: action ?? () => context.push(route!),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Insets.lg,
              vertical: Insets.md,
            ),
            child: Row(
              children: [
                LocalSvgIcon(
                  icon,
                  color: Colors.black54,
                  size: 22,
                ),
                const Gap(Insets.md),
                Text(
                  text,
                  style: style ??
                      const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                )
              ],
            ),
          ),
        ),
      );
}
