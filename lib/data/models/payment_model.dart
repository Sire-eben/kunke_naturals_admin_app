class PaymentModel {
  String? type;
  String? paymentId;
  int? amount;
  String? customerName;
  String? createdAt;

  PaymentModel({
    this.type,
    this.paymentId,
    this.amount,
    this.customerName,
    this.createdAt,
  });

  PaymentModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    customerName = json['customer_name'];
    amount = json['amount'];
    paymentId = json['payment_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['customer_name'] = customerName;
    data['amount'] = amount;
    data['payment_id'] = paymentId;
    data['created_at'] = createdAt;

    return data;
  }
}
