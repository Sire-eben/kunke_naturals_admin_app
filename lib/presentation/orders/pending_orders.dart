import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kunke_naturals_admin_app/config/constants.dart';
import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/global/global.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/extensions.dart';
import 'package:kunke_naturals_admin_app/core/widgets/divider/app_divider.dart';
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';
import 'package:kunke_naturals_admin_app/core/widgets/main_loader/circular_indicator.dart';
import 'package:kunke_naturals_admin_app/core/widgets/state/empty.dart';
import 'package:kunke_naturals_admin_app/data/models/order_model.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';
import 'package:provider/provider.dart';

enum BookingDisplayType { withAppBar, withoutAppBar }

class PendingOrdersPage extends StatefulWidget {
  final BookingDisplayType bookingDisplayType;

  const PendingOrdersPage({
    Key? key,
    this.bookingDisplayType = BookingDisplayType.withoutAppBar,
  }) : super(key: key);

  @override
  State<PendingOrdersPage> createState() => _PendingOrdersPageState();
}

class _PendingOrdersPageState extends State<PendingOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Pending Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Insets.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: StreamBuilder<dynamic>(
                stream: firebaseFirestore
                    .collection(DbCollectionIds.orders)
                    .where("order_status", isEqualTo: "pending")
                    // .orderBy('created_at')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingIndicator();
                  } else if (snapshot.data!.docs.length == 0) {
                    return const Center(
                      child: EmptyOrErrorWidget(
                        title: 'No Pending Orders',
                        subtitle: 'You have no pending orders',
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        OrderModel orders = OrderModel.fromJson(
                            snapshot.data!.docs[index].data()!
                                as Map<String, dynamic>);
                        return Container(
                            width: context.width,
                            padding: const EdgeInsets.all(Insets.lg),
                            margin: const EdgeInsets.only(bottom: Insets.md),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors().containerColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          orders.selectedproducts!.join(', '),
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Gap(Insets.sm),
                                        Text(
                                          'Booked ${orders.createdAt.toString().toReadableDateString(relativeToNow: true)}\nBy '
                                          '${orders.customerName.toString()}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'NGN ${orders.amountPaid.toString()}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                const AppDivider(
                                  color: Colors.black26,
                                ),

                                // DATE AND TIME
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    LocalSvgIcon(
                                      Assets.icons.bulk.clock1,
                                      color: Colors.green,
                                    ),
                                    const Text(
                                      'Pending',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ));
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
