import 'package:equatable/equatable.dart';

class BusinessModel extends Equatable {
  final String vendorId;
  final String businessId;
  final String businessName;
  final String businessDes;
  final String businessPhone;
  final String businessAddress;
  final String country;
  final int earnings;
  final String state;
  final String city;
  final String weekStart;
  final String weekEnd;
  final String facebook;
  final String instagram;
  final String website;

  const BusinessModel({
    required this.vendorId,
    required this.businessId,
    required this.businessName,
    required this.businessDes,
    required this.businessPhone,
    required this.businessAddress,
    required this.country,
    required this.earnings,
    required this.state,
    required this.city,
    required this.weekStart,
    required this.weekEnd,
    required this.facebook,
    required this.instagram,
    required this.website,
  });

  factory BusinessModel.empty() => const BusinessModel(
        vendorId: '',
        businessId: '',
        businessName: '',
        businessDes: '',
        businessAddress: '',
        businessPhone: '',
        country: '',
        earnings: 0,
        state: '',
        city: '',
        weekStart: '',
        weekEnd: '',
        facebook: '',
        instagram: '',
        website: '',
      );

  factory BusinessModel.fromMap(Map<String, dynamic> map) {
    return BusinessModel(
      vendorId: map['vendor_id'] ?? "",
      businessId: map['business_id'] ?? "",
      businessName: map['business_name'] ?? "",
      businessAddress: map['business_address'] ?? "",
      businessDes: map['business_description'] ?? "",
      businessPhone: map['business_phone'] ?? "",
      country: map['country'] ?? "",
      state: map['state'] ?? '',
      city: map['city'] ?? '',
      earnings: map['earnings'] ?? '',
      weekEnd: map['week_end'] ?? '',
      weekStart: map['week_start'] ?? "",
      website: map['website'] ?? "",
      facebook: map['facebook'] ?? "",
      instagram: map['instagram'] ?? "",
    );
  }

  Map<String, dynamic> toMap() => {
        'vendor_id': vendorId,
        'business_id': businessId,
        'business_name': businessName,
        'business_description': businessDes,
        'business_address': businessAddress,
        'business_phone': businessPhone,
        'country': country,
        'state': state,
        'city': city,
        'earnings': earnings,
        'week_end': weekEnd,
        'week_start': weekStart,
        'website': website,
        'facebook': facebook,
        'instagram': instagram,
      };

  @override
  List<Object> get props {
    return [
      vendorId,
      businessId,
      businessName,
      businessAddress,
      businessDes,
      businessPhone,
      country,
      state,
      city,
      earnings,
      weekEnd,
      weekStart,
      website,
      facebook,
      instagram,
    ];
  }

  BusinessModel copyWith({
    String? vendorId,
    String? businessId,
    String? businessName,
    String? businessDes,
    String? businessPhone,
    String? businessAddress,
    String? country,
    int? earnings,
    String? state,
    String? city,
    String? weekStart,
    String? weekEnd,
    String? facebook,
    String? instagram,
    String? website,
  }) {
    return BusinessModel(
      vendorId: vendorId ?? this.vendorId,
      businessId: businessId ?? this.businessId,
      businessName: businessName ?? this.businessName,
      businessAddress: businessAddress ?? this.businessAddress,
      businessDes: businessDes ?? this.businessDes,
      businessPhone: businessPhone ?? this.businessPhone,
      country: country ?? this.country,
      earnings: earnings ?? this.earnings,
      state: state ?? this.state,
      city: city ?? this.city,
      weekStart: weekStart ?? this.weekStart,
      weekEnd: weekEnd ?? this.weekEnd,
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
      website: website ?? this.website,
    );
  }
}

// class BusinessModel {
//   String? vendorId;
//   String? businessId;
//   String? businessName;
//   String? businessDes;
//   String? businessPhone;
//   String? businessAddress;
//   String? country;
//   String? earnings;
//   String? state;
//   String? city;
//   String? weekStart;
//   String? weekEnd;
//   String? facebook;
//   String? instagram;
//   String? website;

//   BusinessModel({
//     this.vendorId,
//     this.businessId,
//     this.businessName,
//     this.businessDes,
//     this.businessPhone,
//     this.businessAddress,
//     this.country,
//     this.earnings,
//     this.state,
//     this.city,
//     this.weekStart,
//     this.weekEnd,
//     this.facebook,
//     this.instagram,
//     this.website,
//   });

//   BusinessModel.fromJson(Map<String, dynamic> json) {
//     vendorId = json["vendor_id"];
//     businessId = json["business_id"];
//     businessName = json["business_name"];
//     businessDes = json["business_description"];
//     businessPhone = json["business_phone"];
//     businessAddress = json["business_address"];
//     country = json["country"];
//     earnings = json["total_earnings"];
//     state = json["state"];
//     city = json["city"];
//     weekStart = json["week_start"];
//     weekEnd = json["week_end"];
//     facebook = json["facebook"];
//     instagram = json["instagram"];
//     website = json["website"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["vendor_id"] = vendorId;
//     data["business_id"] = businessId;
//     data["business_name"] = businessName;
//     data["business_description"] = businessDes;
//     data["business_phone"] = businessPhone;
//     data["business_address"] = businessAddress;
//     data["country"] = country;
//     data["total_earnings"] = earnings;
//     data["state"] = state;
//     data["city"] = city;
//     data["week_start"] = weekStart;
//     data["week_end"] = weekEnd;
//     data["facebook"] = facebook;
//     data["instagram"] = instagram;
//     data["website"] = website;

//     return data;
//   }
// }
