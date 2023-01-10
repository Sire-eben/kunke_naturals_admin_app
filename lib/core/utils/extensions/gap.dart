import 'package:gap/gap.dart';
import 'package:kunke_naturals_admin_app/config/theme.dart';

extension GapExtension on Gap {
  static const Gap md = Gap(Insets.md);
  static const Gap lg = Gap(Insets.lg);
  static const Gap xl = Gap(Insets.xl);
  operator +(int count) => Gap(Insets.lg * count);
}
