import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kunke_naturals_admin_app/config/constants.dart';
import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/string.dart';
import 'package:kunke_naturals_admin_app/core/utils/money_formatter.dart';
import 'package:kunke_naturals_admin_app/core/widgets/appbar.dart';
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';
import 'package:kunke_naturals_admin_app/core/widgets/main_loader/circular_indicator.dart';
import 'package:kunke_naturals_admin_app/core/widgets/state/empty.dart';
import 'package:kunke_naturals_admin_app/data/models/payment_model.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';

class PaymentsAndCards extends StatefulWidget {
  const PaymentsAndCards({super.key});

  @override
  State<PaymentsAndCards> createState() => _PaymentsAndCardsState();
}

class _PaymentsAndCardsState extends State<PaymentsAndCards> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // final money = context.money();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbar(
        title: 'Payments and cards',
      ),
      body: Padding(
        padding: const EdgeInsets.all(Insets.lg),
        child: StreamBuilder<dynamic>(
          stream: _firestore
              .collection(DbCollectionIds.payment)
              .orderBy('created_at')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingIndicator();
            } else if (snapshot.data!.docs.length == 0) {
              return Center(
                child: EmptyOrErrorWidget(
                  iconUrl: Assets.icons.bulk.cardReceive,
                  title: 'No transactions to show',
                  subtitle: 'You have not made any payments yet',
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  PaymentModel payment = PaymentModel.fromJson(
                      snapshot.data!.docs[index].data()!
                          as Map<String, dynamic>);

                  final naira = MoneySymbols.ngn;

                  final title =
                      payment.type == 'in-flow' ? 'inflow' : 'outflow';
                  final iconColor =
                      payment.type == 'in-flow' ? Colors.green : Colors.red;
                  final icon = payment.type == 'in-flow'
                      ? Assets.icons.linear.arrowDown2
                      : Assets.icons.linear.arrowUp2;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: Insets.md),
                    child: Container(
                      // onTap: () {
                      //   // context.push();
                      // },
                      decoration: BoxDecoration(
                          color: AppColors().containerColor,
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(
                        vertical: Insets.lg,
                        horizontal: Insets.md,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LocalSvgIcon(
                            icon,
                            color: iconColor,
                          ),
                          const Gap(Insets.md),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                payment.type.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                payment.createdAt
                                    .toString()
                                    .toReadableDateString(
                                        relativeToNow: true, withTime: true),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            '$naira ${payment.amount.toString()}',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
