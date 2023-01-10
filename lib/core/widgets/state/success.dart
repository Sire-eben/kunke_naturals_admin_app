import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/widgets/appbar.dart';
import 'package:kunke_naturals_admin_app/core/widgets/buttons/style1.dart';
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SuccessPage extends StatelessWidget {
  final String title, subtitle, btnLabel;
  final String? iconUrl;
  final Function(BuildContext)? onBtnPressed;
  const SuccessPage(
      {this.title = "",
      this.subtitle = "",
      this.btnLabel = "Continue",
      this.iconUrl,
      this.onBtnPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconUrl = this.iconUrl ?? Assets.images.leaf.path;
    return Scaffold(
      appBar: CustomAppbar(
        showLeading: false,
        appbarType: AppbarType.dark,
      ),
      backgroundColor: AppColors.backgroundDark,
      body: Padding(
        padding: const EdgeInsets.all(Insets.lg),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(Insets.lg),
                    decoration: const BoxDecoration(
                      color: Colors.white10,
                      shape: BoxShape.circle,
                    ),
                    child: LocalSvgImage(
                      Assets.images.leaf.path,
                    ),
                  ),
                  const Gap(Insets.md),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(Insets.sm),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ButtonOne(
              label: btnLabel,
              action: () => onBtnPressed?.call(context),
            ),
            const Gap(Insets.lg),
          ],
        ),
      ),
    );
  }
}
