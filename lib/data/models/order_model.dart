class OrderModel {
  String? orderId;
  String? customerId;
  String? customerName;
  String? customerPhone;
  String? customerEmail;
  List? productIds;
  List? selectedproducts;
  int? amountPaid;
  bool? successful;
  String? createdAt;
  String? updatedAt;
  String? orderStatus;

  OrderModel({
    this.orderId,
    this.customerId,
    this.customerName,
    this.customerPhone,
    this.customerEmail,
    this.productIds,
    this.selectedproducts,
    this.successful,
    this.amountPaid,
    this.createdAt,
    this.updatedAt,
    this.orderStatus,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    customerEmail = json['customer_email'];
    productIds = json['product_id'];
    selectedproducts = json['selected_products'];
    successful = json['successful'];
    amountPaid = json['amount_paid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderStatus = json['order_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['customer_id'] = customerId;
    data['customer_name'] = customerName;
    data['customer_phone'] = customerPhone;
    data['customer_email'] = customerEmail;
    data['product_id'] = productIds;
    data['selected_products'] = selectedproducts;
    data['successful'] = successful;
    data['amount_paid'] = amountPaid;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['order_status'] = orderStatus;

    return data;
  }
}
