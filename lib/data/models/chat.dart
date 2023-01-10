class ChatModel {
  String? userId;
  String? vendorId;
  String? customerId;
  String? customerName;
  String? customerPhone;
  String? vendorName;
  String? chatId;
  String? messageId;
  String? message;
  String? createdAt;

  ChatModel({
    this.userId,
    this.vendorId,
    this.vendorName,
    this.customerId,
    this.customerName,
    this.customerPhone,
    this.chatId,
    this.messageId,
    this.message,
    this.createdAt,
  });

  ChatModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    customerId = json['customer_id'];
    vendorId = json['vendor_id'];
    vendorName = json['vendor_name'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    message = json['message'];
    chatId = json['chat_id'];
    messageId = json['message_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['vendor_id'] = vendorId;
    data['customer_id'] = customerId;
    data['vendor_name'] = vendorName;
    data['customer_name'] = customerName;
    data['customer_phone'] = customerPhone;
    data['chat_id'] = chatId;
    data['message_id'] = messageId;
    data['message'] = message;
    data['created_at'] = createdAt;

    return data;
  }
}
