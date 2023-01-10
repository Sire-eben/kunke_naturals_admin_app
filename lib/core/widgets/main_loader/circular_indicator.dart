import 'package:flutter/material.dart';
import 'package:kunke_naturals_admin_app/config/theme.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryLight,
        strokeWidth: 3,
      ),
    );
  }
}
