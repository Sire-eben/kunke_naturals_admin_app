import 'package:kunke_naturals_admin_app/config/constants.dart';
import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/global/global.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/extensions.dart';
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';
import 'package:kunke_naturals_admin_app/data/models/review_model.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RecentReviewWidget extends StatelessWidget {
  const RecentReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: context.getHeight(.125)),
      child: StreamBuilder<dynamic>(
          stream: firebaseFirestore
              .collection(DbCollectionIds.reviews)
              .orderBy('created_at')
              .limitToLast(1)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('... ..');
            }
            if (snapshot.data!.docs.length == 0) {
              // print(model.uid);
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(Insets.lg),
                  child: Text('No Recent reviews'),
                ),
              );
            } else {
              return SizedBox(
                // height: 41,
                width: context.width,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (_, index) {
                      ReviewModel review = ReviewModel.fromJson(
                          snapshot.data!.docs[index].data()!
                              as Map<String, dynamic>);
                      return Container(
                        alignment: Alignment.center,
                        width: context.width,
                        // height: context.getHeight(.1),
                        padding: const EdgeInsets.all(Insets.md),
                        margin: const EdgeInsets.only(bottom: Insets.md),
                        decoration: BoxDecoration(
                            color: Color(0xFFFCF7F7),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            review.rating == null
                                ? const SizedBox.shrink()
                                : RatingBar.builder(
                                    itemSize: 15,
                                    initialRating: review.rating!,
                                    // minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    itemBuilder: (context, _) => LocalSvgIcon(
                                      Assets.icons.bulk.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (double rating) {
                                      null;
                                    },
                                  ),
                            Text(
                              review.message.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '${review.customerName} (${review.rating.toString()})',
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                    fontStyle: FontStyle.italic),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              );
            }
          }),
    );
  }
}
