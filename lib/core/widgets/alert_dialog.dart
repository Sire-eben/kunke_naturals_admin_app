import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String? primaryText;
  final VoidCallback? primaryAction;
  final String? secondaryText;
  final VoidCallback? secondaryAction;

  const AppAlertDialog(
      {Key? key,
      required this.title,
      required this.content,
      this.primaryText,
      this.primaryAction,
      this.secondaryText,
      this.secondaryAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: context.getHeight(.2),
            maxWidth: context.width,
          ),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.borderColor,
                ),
              ),
              const Gap(Insets.lg),
              Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.borderColor,
                  fontSize: 14,
                ),
              ),
              const Gap(Insets.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: primaryAction ?? () => context.pop(),
                    child: Container(
                      height: 50,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent,
                          border: Border.all(
                            width: 1,
                            color: AppColors.borderColor,
                          )),
                      child: Text(primaryText ?? 'Cancel'),
                    ),
                  ),
                  InkWell(
                    onTap: secondaryAction,
                    child: Container(
                      height: 50,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primaryColor,
                      ),
                      child: Text(
                        secondaryText ?? 'Continue',
                        style: const TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        alignment: Alignment.center,
      );
}
