import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';
import 'package:kunke_naturals_admin_app/presentation/homescreens/business_home.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';
import 'package:kunke_naturals_admin_app/presentation/navigation/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kunke_naturals_admin_app/presentation/notification/notification.dart';
import 'package:kunke_naturals_admin_app/presentation/orders/orders.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final PageController homepageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int index = 0;
  final screens = [
    const HomePage(),
    const OrdersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        key: _scaffoldKey,
        drawer: const SideMenu(),
        appBar: AppBar(
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          leading: InkWell(
              // onTap: () => _scaffoldKey.currentState!.openDrawer(),
              child: LocalSvgIcon(
            Assets.icons.twotone.menu,
            color: Colors.black87,
          )),
          actions: [
            CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.primaryColor,
              child: LocalSvgIcon(
                Assets.icons.bulk.user,
                color: Colors.white,
              ),
            ),
            const Gap(Insets.md),
          ],
        ),
        body: screens[index],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          backgroundColor: Colors.white60,

          currentIndex: index,
          onTap: (index) => setState(() => this.index = index),
          type: BottomNavigationBarType.fixed,
          //animationDuration: const Duration(milliseconds: 500),
          items: _items
              .map(
                (item) => BottomNavigationBarItem(
                  label: item.title,
                  tooltip: item.title,
                  activeIcon: LocalSvgIcon(
                    item.icon,
                    color: AppColors.primaryColor,
                  ),
                  icon: LocalSvgIcon(
                    item.inactiveIcon,
                    color: AppColors.primaryColor.withOpacity(0.7),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _Item {
  const _Item({
    required this.title,
    required this.icon,
    required this.inactiveIcon,
  });

  final String title, icon, inactiveIcon;
}

final _items = <_Item>[
  _Item(
    title: 'Home',
    inactiveIcon: Assets.icons.linear.home2,
    icon: Assets.icons.bulk.home2,
  ),
  _Item(
    title: 'Orders',
    inactiveIcon: Assets.icons.linear.shoppingCart,
    icon: Assets.icons.bulk.shoppingCart,
  ),
];
