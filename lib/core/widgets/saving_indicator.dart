import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SavingProgressIndicator extends StatelessWidget {
  final String msg;

  const SavingProgressIndicator({Key? key, required this.msg})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/gif/loader.gif",
            height: 125.0,
            width: 125.0,
          ),
          const Gap(Insets.lg),
          Text(
            "$msg,\nplease wait...",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.backgroundDark,
            ),
          )
        ],
      );
}
