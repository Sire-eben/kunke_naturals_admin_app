import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/context.dart';
import 'package:kunke_naturals_admin_app/core/utils/string.dart';
import 'package:kunke_naturals_admin_app/core/widgets/appbar.dart';
import 'package:kunke_naturals_admin_app/core/widgets/buttons/style1.dart';
import 'package:kunke_naturals_admin_app/data/models/products_model.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.product.productName.toString(),
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Insets.lg),
          child: Column(
            children: [
              SizedBox(
                width: context.width,
                height: 220,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.product.productImages!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        width: context.getWidth(.7),
                        margin: const EdgeInsets.only(right: Insets.md),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.product.productImages![0],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              ),
              const Gap(Insets.lg),
              // const TitleWidget(text: 'Product Name'),
              TitleAndSubtitleWidget(
                  heading: 'Product Id',
                  subheading: "${widget.product.productId}"),
              TitleAndSubtitleWidget(
                  heading: 'Product Name',
                  subheading: widget.product.productName.toString()),
              // const TitleWidget(text: 'Product Description'),
              TitleAndSubtitleWidget(
                  heading: 'Product Description',
                  subheading: widget.product.productDes.toString()),
              TitleAndSubtitleWidget(
                  heading: 'Price', subheading: "₦ ${widget.product.price}"),
              TitleAndSubtitleWidget(
                heading: 'Date Uploaded',
                subheading: widget.product.createdAt
                    .toString()
                    .toReadableDateString(relativeToNow: true),
              ),
              const Gap(Insets.lg),
              ButtonOne(
                  btnColor: AppColors.error,
                  action: () {},
                  label: "Delete Product"),
              const Gap(Insets.md),
              ButtonOne(
                  btnColor: AppColors.primaryLight,
                  action: () {},
                  label: "Edit Product"),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleAndSubtitleWidget extends StatelessWidget {
  final String heading;
  final String subheading;
  const TitleAndSubtitleWidget({
    Key? key,
    required this.heading,
    required this.subheading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.width,
          padding: const EdgeInsets.all(Insets.sm),
          margin: const EdgeInsets.only(bottom: Insets.sm, top: Insets.md),
          color: AppColors.primaryLight.withOpacity(.1),
          child: Text(
            '$heading:',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            subheading,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
