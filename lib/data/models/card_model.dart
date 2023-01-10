class CardModel {
  String? cardId;
  String? paymentId;
  String? typeOfCard;
  String? cardNumber;
  String? cvc;
  String? month;
  String? year;
  String? createdAt;

  CardModel({
    this.cardId,
    this.paymentId,
    this.typeOfCard,
    this.cardNumber,
    this.cvc,
    this.month,
    this.year,
    this.createdAt,
  });

  CardModel.fromJson(Map<String, dynamic> json) {
    typeOfCard = json['type'];
    cardNumber = json['card_number'];
    cvc = json['cvc'];
    month = json['month'];
    year = json['year'];
    cardId = json['card_id'];
    paymentId = json['payment_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = typeOfCard;
    data['card_number'] = cardNumber;
    data['cvc'] = cvc;
    data['month'] = month;
    data['year'] = year;
    data['card_id'] = cardId;
    data['payment_id'] = paymentId;
    data['created_at'] = createdAt;

    return data;
  }
}
