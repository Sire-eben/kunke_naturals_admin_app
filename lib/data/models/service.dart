class ServicesModel {
  String? vendorId;
  String? businessId;
  String? serviceId;
  String? serviceName;
  String? serviceDes;
  String? serviceCategory;
  String? createdAt;
  String? updatedAt;
  String? priceName;
  int? priceValue;
  String? serviceUnit;
  String? priceName2;
  int? priceValue2;
  int? couponValue;
  bool? addCoupon;
  List<dynamic>? serviceImages;

  ServicesModel({
    this.vendorId,
    this.businessId,
    this.createdAt,
    this.priceName,
    this.priceValue,
    this.couponValue,
    this.priceName2,
    this.priceValue2,
    this.serviceCategory,
    this.serviceDes,
    this.serviceId,
    this.serviceUnit,
    this.serviceImages,
    this.serviceName,
    this.addCoupon,
  });

  ServicesModel.fromJson(Map<String, dynamic> json) {
    vendorId = json["vendor_id"];
    businessId = json["business_id"];
    createdAt = json["created_at"];
    createdAt = json["updated_at"];
    priceName = json["price_name"];
    priceValue = json["price_value"];
    priceName2 = json["price_name_2"];
    priceValue2 = json["price_value_2"];
    couponValue = json["coupon_value"];
    serviceName = json["service_name"];
    serviceCategory = json["service_category"];
    serviceDes = json["service_description"];
    serviceId = json["service_id"];
    serviceUnit = json["service_unit"];
    serviceImages = json["service_images"];
    addCoupon = json["coupon"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["vendor_id"] = vendorId;
    data["business_id"] = businessId;
    data["created_at"] = createdAt;
    data["price_name"] = priceName;
    data["price_value"] = priceValue;
    data["price_name_2"] = priceName2;
    data["price_value_2"] = priceValue2;
    data["coupon_value"] = couponValue;
    data["service_name"] = serviceName;
    data["service_category"] = serviceCategory;
    data["service_description"] = serviceDes;
    data["service_id"] = serviceId;
    data["service_unit"] = serviceUnit;
    data["service_images"] = serviceImages;
    data["coupon"] = addCoupon;
    data["updated_at"] = serviceImages;

    return data;
  }
}
