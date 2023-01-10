import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/presentation/homescreens/widgets/recent_review.dart';
import 'package:kunke_naturals_admin_app/presentation/homescreens/widgets/dashboard_container.dart';
import 'package:kunke_naturals_admin_app/presentation/homescreens/widgets/quick_action_grid.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switchVal = false;
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Insets.lg, vertical: Insets.lg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              BusinessDashboardContainer(),
              Gap(Insets.md),
              QuickActionGrid(),
              Gap(Insets.md),
              HomeHeaderWidget(
                text: 'Recent reviews',
              ),
              RecentReviewWidget(),
              Gap(Insets.md),
              HomeHeaderWidget(
                text: 'Transactions',
              ),
              // const DashboardPayments(),
              Gap(Insets.md),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeHeaderWidget extends StatelessWidget {
  final String text;

  const HomeHeaderWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.sm),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
