// import 'package:kunke_naturals_admin_app/image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';

class QuickActionItem {
  const QuickActionItem({
    required this.icon,
    required this.title,
    this.onPressed,
    this.badge = ItemBadge.none,
  });

  final String icon, title;
  final Function(BuildContext)? onPressed;
  final ItemBadge badge;
}

enum ItemBadge {
  none,
  // ignore: constant_identifier_names
  coming_soon,
  // ignore: constant_identifier_names
  new_feature,
}

class QuickActionGridItem extends StatelessWidget {
  final QuickActionItem item;
  const QuickActionGridItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        item.onPressed?.call(context);
      },
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(Insets.sm),
                margin: const EdgeInsets.only(right: Insets.sm),
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: Corners.lgBorder,
                ),
                child: LocalSvgIcon(
                  item.icon,
                  size: 24,
                  color: AppColors.primaryColor,
                ),
              ),
              if (item.badge == ItemBadge.new_feature)
                Positioned(
                  right: -Insets.xs,
                  top: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: Corners.lgBorder,
                    ),
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 3),
                    child: const Text(
                      "new",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (item.badge == ItemBadge.coming_soon)
                Positioned(
                  right: -Insets.xs,
                  top: -Insets.xs,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: Corners.lgBorder,
                    ),
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 3),
                    child: const Text(
                      "coming soon",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const Gap(Insets.xs),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
