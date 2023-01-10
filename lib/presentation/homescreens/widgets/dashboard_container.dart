import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/utils/money_formatter.dart';
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BusinessDashboardContainer extends StatelessWidget {
  const BusinessDashboardContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OverviewContent(
      businessName: 'Kunke Naturals',
    );
  }
}

class OverviewContent extends StatefulWidget {
  final String? businessName;

  const OverviewContent({
    super.key,
    this.businessName,
  });

  @override
  State<OverviewContent> createState() => _OverviewContentState();
}

class _OverviewContentState extends State<OverviewContent> {
  bool showBalance = false;
  @override
  Widget build(BuildContext context) {
    String naira = MoneySymbols.ngn;

    return Container(
      width: double.infinity,
      height: 151,
      padding: const EdgeInsets.all(Insets.md),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                showBalance = !showBalance;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LocalSvgIcon(
                  showBalance
                      ? Assets.icons.linear.eye
                      : Assets.icons.linear.eyeSlash,
                  color: Colors.white,
                ),
                const Gap(Insets.sm),
                const Text(
                  'Show balance',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome Back",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              ),
              //Gap(Insets.sm),
              Text(
                widget.businessName.toString(),
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Total Earnings",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        color: Colors.white),
                  ),
                  Text(
                    "******",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
