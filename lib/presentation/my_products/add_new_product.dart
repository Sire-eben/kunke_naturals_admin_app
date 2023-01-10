import 'dart:io';

import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/mixins/form_mixin.dart';
import 'package:kunke_naturals_admin_app/core/providers/products_provider.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/extensions.dart';
import 'package:kunke_naturals_admin_app/core/utils/validators.dart';
import 'package:kunke_naturals_admin_app/core/widgets/appbar.dart';
import 'package:kunke_naturals_admin_app/core/widgets/buttons/style1.dart';
import 'package:kunke_naturals_admin_app/core/widgets/buttons/style2.dart';
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';
import 'package:kunke_naturals_admin_app/core/widgets/main_loader/circular_indicator.dart';
import 'package:kunke_naturals_admin_app/core/widgets/textfield/textfield.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

enum ProductsDisplayType { newProduct, oldProduct }

class AddNewProductsPage extends StatefulWidget {
  final ProductsDisplayType productsDisplayType;

  const AddNewProductsPage({
    Key? key,
    this.productsDisplayType = ProductsDisplayType.newProduct,
  }) : super(key: key);

  @override
  State<AddNewProductsPage> createState() => _AddNewProductsPageState();
}

class _AddNewProductsPageState extends State<AddNewProductsPage>
    with FormMixin {
  final ImagePicker _picker = ImagePicker();

  TextEditingController productName = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController couponValue = TextEditingController();
  // int quantity = 1;

  final List<XFile> _selectedFiles = [];
  FirebaseStorage storageRef = FirebaseStorage.instance;
  // final List<String> _arrImageUrls = [];
  int uploadItem = 0;
  bool _addCoupon = false;

  Future<void> selectImages() async {
    try {
      final List<XFile>? imgs = await _picker.pickMultiImage();
      if (imgs!.isNotEmpty) {
        _selectedFiles.addAll(imgs);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Something went wrong. ${e.toString()}")));
    }
    setState(() {
      _selectedFiles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, auth, child) {
        Future<void> saveProduct() async {
          if (_selectedFiles.isNotEmpty && _selectedFiles.length <= 5) {
            if (_addCoupon == false) {
              if (formKey.currentState!.validate()) {
                await auth.uploadFunction(
                  _selectedFiles,
                  context,
                  productName.text.trim(),
                  productDescription.text.trim(),
                  priceController.text.trim(),
                  quantityController.text,
                  _addCoupon,
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Coupon field can not be empty if active")));
            }
          } else if (_selectedFiles.length > 5) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Images cannot be more than 5")));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Add Images")));
          }
        }

        return auth.isLoading == true
            ? Scaffold(body: const LoadingIndicator())
            : Scaffold(
                appBar: CustomAppbar(
                  title: widget.productsDisplayType ==
                          ProductsDisplayType.newProduct
                      ? "Add new Product"
                      : "Edit product",
                  actions: [
                    TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primaryColor,
                        ),
                        onPressed: () => saveProduct(),
                        child: const Text("Save"))
                  ],
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(Insets.lg),
                    child: Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (_selectedFiles.isEmpty)
                              InkWell(
                                onTap: () {
                                  selectImages();
                                },
                                child: Container(
                                  height: 220,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.grey.shade300,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      LocalSvgIcon(
                                        Assets.icons.bulk.add,
                                        color: Colors.grey,
                                        size: 26,
                                      ),
                                      const Gap(Insets.sm),
                                      Text("Choose image(s)")
                                    ],
                                  ),
                                ),
                              )
                            else
                              const SizedBox.shrink(),
                            const Gap(Insets.lg),
                            if (_selectedFiles.isEmpty)
                              const SizedBox.shrink()
                            else
                              SizedBox(
                                height: context.getHeight(.3),
                                width: context.getWidth(),
                                // padding: EdgeInsets.all(Insets.xs),
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: _selectedFiles.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.all(Insets.sm),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Corners.smRadius),
                                          child: Image.file(
                                            File(_selectedFiles[index].path),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            const Gap(Insets.md),
                            if (_selectedFiles.isEmpty)
                              const SizedBox.shrink()
                            else
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Show images of Product",
                                      style: TextStyle(fontSize: 13)),
                                  // auth.isLoading == false
                                  //     ? showLoading()
                                  //     :
                                  TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
                                      ),
                                      onPressed: () {
                                        selectImages();
                                      },
                                      // icon: LocalSvgIcon(Assets.icons.bulk.import1),
                                      child: const Text(
                                        "More images",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ],
                              ),
                            const Gap(Insets.md),
                            TextInputField(
                              labelText: "Product Name",
                              hintText: "Enter the Product name",
                              prefixIcon:
                                  LocalSvgIcon(Assets.icons.linear.shop),
                              controller: productName,
                              validator:
                                  Validators.validateString(minLength: 5),
                            ),
                            const Gap(Insets.md),
                            TextInputField(
                              maxLines: 6,
                              controller: productDescription,
                              labelText: "Product Description",
                              hintText: "Describe your product or Product",
                              validator: Validators.validateString(),
                              prefixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  LocalSvgIcon(Assets.icons.linear.designtools),
                                ],
                              ),
                            ),
                            const Gap(Insets.md),

                            //PRICE
                            TextInputField(
                              labelText: "Price",
                              hintText: "Enter amount",
                              prefixIcon: LocalSvgIcon(
                                  Assets.icons.linear.dollarCircle),
                              controller: priceController,
                              inputType: TextInputType.number,
                              validator: Validators.validateAmount(),
                              prefixText: "NGN ",
                            ),
                            const Gap(Insets.md),

                            //QTY
                            TextInputField(
                              labelText: "Quantity available",
                              hintText: "Enter digit",
                              prefixIcon:
                                  LocalSvgIcon(Assets.icons.linear.note),
                              controller: quantityController,
                              inputType: TextInputType.number,
                              validator: Validators.validateString(),
                            ),
                            const Gap(Insets.md),

                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton.icon(
                                onPressed: () {
                                  setState(() {
                                    _addCoupon = !_addCoupon;
                                  });
                                },
                                icon: LocalSvgIcon(_addCoupon
                                    ? Assets.icons.bulk.closeCircle
                                    : Assets.icons.bulk.add),
                                label: Text(
                                  _addCoupon ? "Remove coupon" : "Add coupon",
                                  style: const TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const Gap(Insets.md),
                            _addCoupon == false
                                ? const SizedBox.shrink()
                                : TextInputField(
                                    labelText: "Coupon",
                                    hintText: "Enter amount",
                                    controller: couponValue,
                                    inputType: TextInputType.number,
                                    validator: Validators.validateAmount(),
                                    prefixText: "NGN",
                                  ),
                            const Gap(Insets.md),
                            ButtonOne(
                                action: () => saveProduct(), label: "Save"),
                            const Gap(Insets.md),
                            ButtonTwo(
                                action: () {
                                  context.pop();
                                },
                                label: "Cancel"),
                            const Gap(Insets.xl),
                          ]),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
