import 'dart:math';

import 'package:kunke_naturals_admin_app/config/constants.dart';
import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/global/global.dart';
import 'package:kunke_naturals_admin_app/core/providers/products_provider.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/context.dart';
import 'package:kunke_naturals_admin_app/core/widgets/appbar.dart';
import 'package:kunke_naturals_admin_app/core/widgets/custom_alert.dart';
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';
import 'package:kunke_naturals_admin_app/core/widgets/main_loader/circular_indicator.dart';
import 'package:kunke_naturals_admin_app/core/widgets/state/empty.dart';
import 'package:kunke_naturals_admin_app/data/models/products_model.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:kunke_naturals_admin_app/presentation/my_products/add_new_product.dart';
import 'package:kunke_naturals_admin_app/presentation/my_products/product_detail.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyProductsPage extends StatefulWidget {
  const MyProductsPage({Key? key}) : super(key: key);

  @override
  State<MyProductsPage> createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  // String _value = "";

  @override
  Widget build(BuildContext context) {
    // const naira = MoneySymbols.ngn;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbar(
        title: "My products",
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(const AddNewProductsPage()),
        // label: const Text("Add New product"),
        label: const Text('Add product'),
        icon: LocalSvgIcon(
          Assets.icons.linear.add,
          size: 28,
          color: AppColors.white,
        ),
      ),
      body: Consumer<ProductsProvider>(builder: (context, auth, child) {
        return StreamBuilder<dynamic>(
            stream: firebaseFirestore
                .collection(DbCollectionIds.products)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingIndicator();
              }
              if (snapshot.data!.docs.length == 0) {
                // print(model.uid);
                return Center(
                  child: EmptyOrErrorWidget(
                    title: 'No listed products',
                    subtitle: 'Add new products to list on the website',
                    onBtnPressed: () =>
                        context.push(const AddNewProductsPage()),
                    buttonLabel: "Add New Product",
                  ),
                );
              } else {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    padding: const EdgeInsets.all(Insets.md),
                    itemBuilder: (context, index) {
                      ProductModel product = ProductModel.fromJson(
                          snapshot.data!.docs[index].data()!
                              as Map<String, dynamic>);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Slidable(
                          // Specify a key if the Slidable is dismissible.
                          key: const ValueKey(0),

                          // The start action pane is the one at the left or the top side.
                          startActionPane: ActionPane(
                            // A motion is a widget used to control how the pane animates.
                            motion: const StretchMotion(),
                            children: [
                              // A SlidableAction can have an icon and/or a label.
                              SlidableAction(
                                onPressed: (context) {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return CustomAlert(
                                            title: "Delete this product",
                                            content:
                                                "You are about to delete this product. "
                                                "It will no longer appear on website. Continue?",
                                            action: () {
                                              auth.deleteThisproduct(
                                                context,
                                                product.productId.toString(),
                                              );
                                            });
                                      });
                                },
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                              SlidableAction(
                                onPressed: (context) {
                                  context.push(const AddNewProductsPage(
                                    productsDisplayType:
                                        ProductsDisplayType.oldProduct,
                                  ));
                                },
                                backgroundColor: AppColors.primaryLight,
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                label: 'Edit',
                              ),
                            ],
                          ),
                          child: ListTile(
                            onTap: () => context.push(ProductDetailPage(
                              product: product,
                            )),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Corners.mdRadius)),
                            tileColor: Colors.grey.shade200,
                            contentPadding: const EdgeInsets.all(Insets.md),
                            leading: Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(
                                    Random().nextInt(127),
                                    Random().nextInt(127),
                                    Random().nextInt(127),
                                    Random().nextInt(255),
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                  image: DecorationImage(
                                    image: product.productImages!.length == 1
                                        ? NetworkImage(
                                            product.productImages![0])
                                        : NetworkImage(
                                            product.productImages![1]),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            title: Text(
                              product.productName!,
                            ),
                            subtitle: Text(
                              '₦ ${product.price}'.toString(),
                            ),
                          ),
                        ),
                      );
                    });
              }
            });
      }),
    );
  }
}
