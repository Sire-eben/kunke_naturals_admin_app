class ReviewModel {
  String? vendorId;
  String? reviewId;
  String? customerId;
  String? customerName;
  String? customerPhone;
  String? message;
  double? rating;
  String? createdAt;
  String? updatedAt;

  ReviewModel({
    this.vendorId,
    this.customerId,
    this.reviewId,
    this.customerName,
    this.customerPhone,
    this.message,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  ReviewModel.fromJson(Map<String, dynamic> json) {
    vendorId = json['vendor_id'];
    customerId = json['customer_id'];
    reviewId = json['review_id'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    message = json['message'];
    rating = json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vendor_id'] = vendorId;
    data['customer_id'] = customerId;
    data['review_id'] = reviewId;
    data['customer_name'] = customerName;
    data['customer_phone'] = customerPhone;
    data['message'] = message;
    data['rating'] = rating;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    return data;
  }
}
