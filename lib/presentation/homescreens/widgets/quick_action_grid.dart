import 'package:kunke_naturals_admin_app/core/utils/extensions/extensions.dart';
import 'package:kunke_naturals_admin_app/presentation/homescreens/widgets/quick_action_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';
import 'package:kunke_naturals_admin_app/presentation/my_products/my_products.dart';
import 'package:kunke_naturals_admin_app/presentation/orders/orders.dart';
import 'package:kunke_naturals_admin_app/presentation/review/reviews.dart';

class QuickActionGrid extends StatelessWidget {
  const QuickActionGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quickItems = [
      QuickActionItem(
        icon: Assets.icons.bulk.buyCrypto,
        title: "My Products",
        onPressed: (context) {
          context.push(const MyProductsPage());
        },
      ),
      QuickActionItem(
        icon: Assets.icons.bulk.shoppingCart,
        title: "My Orders",
        onPressed: (context) => context.push(const OrdersPage()),
      ),
      QuickActionItem(
        icon: Assets.icons.bulk.sms,
        title: "Messages",
      ),
      QuickActionItem(
        icon: Assets.icons.bulk.star1,
        title: "Customer Reviews",
        onPressed: (context) => context.push(const ReviewsPage()),
      ),
    ];

    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 5 / 2),
      children: [
        for (final item in quickItems) QuickActionGridItem(item),
      ],
    );
  }
}
