class ProductModel {
  String? productId;
  String? productName;
  String? productDes;
  String? createdAt;
  String? updatedAt;
  int? price;
  int? quantity;
  int? couponValue;
  bool? addCoupon;
  List<dynamic>? productImages;

  ProductModel({
    this.createdAt,
    this.updatedAt,
    this.quantity,
    this.price,
    this.couponValue,
    this.productDes,
    this.productId,
    this.productImages,
    this.productName,
    this.addCoupon,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    createdAt = json["created_at"];
    createdAt = json["updated_at"];
    couponValue = json["coupon_value"];
    productName = json["product_name"];
    price = json["product_price"];
    quantity = json["product_qty"];
    productDes = json["product_description"];
    productId = json["product_id"];
    productImages = json["imageUrls"];
    addCoupon = json["coupon"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["created_at"] = createdAt;
    data["coupon_value"] = couponValue;
    data["product_name"] = productName;
    data["product_price"] = price;
    data["product_qty"] = quantity;
    data["product_description"] = productDes;
    data["product_id"] = productId;
    data["imageUrls"] = productImages;
    data["coupon"] = addCoupon;
    data["updated_at"] = productImages;

    return data;
  }
}
