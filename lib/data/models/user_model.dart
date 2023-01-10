import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String emailAddress;
  final String phoneNumber;
  final String createdAt;

  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.createdAt,
  });

  factory UserModel.empty() => const UserModel(
        id: '',
        firstName: '',
        lastName: '',
        fullName: '',
        emailAddress: '',
        phoneNumber: '',
        createdAt: '',
      );

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? "",
      firstName: map['first_name'] ?? "",
      lastName: map['last_name'] ?? "",
      fullName: map['full_name'] ?? "",
      emailAddress: map['email_address'] ?? "",
      phoneNumber: map['phone_number'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'full_name': fullName,
        'email_address': emailAddress,
        'phone_number': phoneNumber,
        'created_at': createdAt,
      };

  @override
  List<Object> get props {
    return [
      id,
      firstName,
      lastName,
      fullName,
      emailAddress,
      phoneNumber,
      createdAt,
    ];
  }

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? fullName,
    String? emailAddress,
    String? phoneNumber,
    String? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fullName: fullName ?? this.fullName,
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
