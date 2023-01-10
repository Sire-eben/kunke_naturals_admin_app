class VendorModel {
  String? firstName;
  String? lastName;
  String? picture;
  String? email;
  String? gender;
  String? phone;
  String? status;
  String? uid;

  VendorModel({
    this.firstName,
    this.lastName,
    this.picture,
    this.email,
    this.gender,
    this.phone,
    this.status,
    this.uid,
  });

  VendorModel.fromJson(Map<String, dynamic> json) {
    firstName = json["first name"];
    lastName = json["last name"];
    email = json["email"];
    picture = json["picture"];
    gender = json["gender"];
    phone = json["phone"];
    status = json["status"];
    uid = json["uid"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["first name"] = firstName;
    data["last name"] = lastName;
    data["picture"] = picture;
    data["phone"] = phone;
    data["email"] = email;
    data["gender"] = gender;
    data["status"] = status;
    data["uid"] = uid;

    return data;
  }
}
