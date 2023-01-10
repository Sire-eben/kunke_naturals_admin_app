class TimeModel {
  String? from;
  String? to;
  String? timeId;
  String? createdAt;
  String? available;

  TimeModel({
    this.from,
    this.to,
    this.timeId,
    this.createdAt,
    this.available,
  });

  TimeModel.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    timeId = json['time_id'];
    createdAt = json['created_at'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['time_id'] = timeId;
    data['created_at'] = createdAt;
    data['available'] = available;

    return data;
  }
}
