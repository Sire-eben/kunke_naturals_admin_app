import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/extensions.dart';
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';
import 'package:kunke_naturals_admin_app/presentation/orders/delivered_orders.dart';
import 'package:kunke_naturals_admin_app/presentation/orders/pending_orders.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Orders')),
      body: Padding(
        padding: const EdgeInsets.all(Insets.lg),
        child: Column(
          children: [
            OrderCards(
              icon: Assets.icons.bulk.clock1,
              text: "Pending orders",
              subtitle: "All Pending orders",
              widget: PendingOrdersPage(),
            ),
            const Gap(Insets.lg),
            OrderCards(
              icon: Assets.icons.bulk.walletCheck,
              text: "Delivered orders",
              subtitle: "All delivered orders",
              widget: DeliveredOrdersPage(),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCards extends StatelessWidget {
  final String icon, text, subtitle;
  final Widget widget;

  const OrderCards({
    Key? key,
    required this.icon,
    required this.text,
    required this.widget,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey.shade200,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Insets.sm,
        horizontal: Insets.sm / 2,
      ),
      onTap: () => context.push(widget),
      leading: LocalSvgIcon(
        icon,
        size: 30,
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 13,
        ),
      ),
    );
  }
}
