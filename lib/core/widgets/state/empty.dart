import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/widgets/buttons/style1.dart';
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmptyOrErrorWidget extends StatelessWidget {
  final String title, subtitle;
  final String? iconUrl, buttonLabel;
  final VoidCallback? onBtnPressed;
  const EmptyOrErrorWidget({
    this.title = "",
    this.subtitle = "",
    this.buttonLabel,
    this.iconUrl,
    this.onBtnPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconUrl = this.iconUrl ?? Assets.icons.bulk.microscope;
    return Padding(
      padding: const EdgeInsets.all(Insets.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LocalSvgIcon(
            iconUrl,
            size: 36,
            color: AppColors.primaryColor,
          ),
          const Gap(Insets.sm),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(Insets.xs),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.borderColor,
            ),
          ),
          if (buttonLabel != null) ...[
            const Gap(Insets.lg),
            ButtonOne(
              label: buttonLabel!,
              action: () => onBtnPressed?.call(),
            ),
          ],
          const Gap(Insets.lg),
        ],
      ),
    );
  }
}
