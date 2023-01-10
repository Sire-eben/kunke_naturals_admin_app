import 'package:kunke_naturals_admin_app/config/constants.dart';
import 'package:kunke_naturals_admin_app/core/global/global.dart';
import 'package:kunke_naturals_admin_app/core/widgets/alert_dialog.dart';
import 'package:kunke_naturals_admin_app/core/widgets/buttons/style1.dart';
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';
import 'package:kunke_naturals_admin_app/presentation/navigation/widgets/drawer_items.dart';
import 'package:kunke_naturals_admin_app/core/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../config/theme.dart';
import '../../generated/assets.gen.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            currentAccountPicture: CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.primaryColor,
              child: LocalSvgIcon(Assets.icons.bulk.user),
            ),
            accountName: Text("Kunke Naturals"),
            accountEmail: Text(
              fAuth.currentUser!.email.toString(),
            ),
            // onDetailsPressed: () => context.push(const ProfilePage()),
          ),
          const Gap(Insets.md),
          DrawerItems(
            icon: Assets.icons.bulk.gift,
            text: "My bookings",
            // route: const SchedulesPage(
            //     bookingDisplayType: BookingDisplayType.withAppBar),
          ),
          DrawerItems(
            icon: Assets.icons.bulk.rotateLeft1,
            text: "Payment History",
            // route: const PaymentsAndCards(),
          ),
          DrawerItems(
            icon: Assets.icons.bulk.share,
            text: "Your Reviews",
            // route: const CustomerReviewPage(),
          ),
          DrawerItems(
            icon: Assets.icons.bulk.headphone,
            text: "Support",
            // route: const HelpCenter(),
          ),
          DrawerItems(
            icon: Assets.icons.bulk.share,
            text: "Share app",
            action: () {
              // Share.share('playstoreUrl');
            },
          ),
          DrawerItems(
            icon: Assets.icons.bulk.documentCloud,
            text: "Terms of use",
            action: () {
              launchUrlString(termsOfUseLink);
            },
          ),
          Consumer<AuthProvider>(builder: (context, signoutEvent, child) {
            return DrawerItems(
              icon: Assets.icons.bulk.documentCloud,
              text: "Logout",
              action: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return signoutEvent.isLoading
                          ? const LoadingButton()
                          : AppAlertDialog(
                              title: "Logout",
                              content:
                                  "Are you sure you want to logout of your account?",
                              primaryText: "Back",
                              primaryAction: () => Navigator.pop(context),
                              secondaryText: "Continue",
                              secondaryAction: signoutEvent.isLoading
                                  ? null
                                  : () => signoutEvent.signOut(context),
                            );
                    });
              },
            );
          }),
          const Gap(Insets.xl * 2),
          DrawerItems(
            icon: Assets.icons.bulk.infoCircle,
            text: appVersion,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            action: () {
              showAboutDialog(
                  context: context,
                  applicationIcon: Image.asset(
                    'assets/images/app_logo.png',
                    width: 40,
                  ),
                  applicationName: appName,
                  applicationVersion: appVersion,
                  children: [
                    Text(
                        'All rights reserved.\nkunke_naturals_admin_app Technologies\n© kunke_naturals_admin_app 2022')
                  ]);
            },
          ),
        ],
      ),
    );
  }
}
