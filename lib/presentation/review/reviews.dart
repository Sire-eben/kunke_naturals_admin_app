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
import 'package:kunke_naturals_admin_app/data/models/review_model.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';
import 'package:provider/provider.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Customer Reviews'),
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
                    .collection(DbCollectionIds.reviews)
                    .orderBy('created_at')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingIndicator();
                  } else if (snapshot.data!.docs.length == 0) {
                    return Center(
                      child: EmptyOrErrorWidget(
                        iconUrl: Assets.icons.bulk.starSlash,
                        title: 'No Reviews',
                        subtitle: 'You have no reviews yet',
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        ReviewModel reviews = ReviewModel.fromJson(
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
                                          reviews.customerName.toString(),
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Gap(Insets.sm),
                                        Text(
                                          'Received ${reviews.createdAt.toString().toReadableDateString(relativeToNow: true)}\nBy '
                                          '${reviews.customerName.toString()}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'NGN ${reviews.rating}',
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
