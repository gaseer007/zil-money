// import 'package:zilmoney_machine_test/models/user_depend_model.dart';
//
// import '../domain/entities/user_entity.dart';
//
// class UserModel extends UserEntity {
//   final int? id;
//   final String name;
//   final String username;
//   final String email;
//   final String phone;
//   final String website;
//   final Address? address;
//   final Company? company;
//
//   UserModel({
//     this.id,
//     required this.name,
//     required this.username,
//     required this.email,
//     required this.phone,
//     required this.website,
//     this.address,
//     this.company,
//   });
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'] as int?,
//       name: json['name'],
//       username: json['username'],
//       email: json['email'],
//       phone: json['phone'],
//       website: json['website'],
//       address:
//           json['address'] != null ? Address.fromJson(json['address']) : null,
//       company:
//           json['company'] != null ? Company.fromJson(json['company']) : null,
//     );
//   }
//
//   // toJson only includes fields used in POST/PUT
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'username': username,
//       'email': email,
//       'phone': phone,
//       'website': website,
//     };
//   }
// }
import 'package:zilmoney_machine_test/models/user_depend_model.dart';

import '../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final Address? address;
  final Company? company;

  UserModel({
    int? id,
    required super.name,
    required super.username,
    required super.email,
    required super.phone,
    required super.website,
    this.address,
    this.company,
  }) : super(id: id ?? 0);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      address:
          json['address'] != null ? Address.fromJson(json['address']) : null,
      company:
          json['company'] != null ? Company.fromJson(json['company']) : null,
    );
  }

  /// For POST/PUT
  @override
  Map<String, dynamic> toJson() {
    final baseJson = super.toJson();
    return {
      ...baseJson,
      if (address != null) 'address': address!.toJson(),
      if (company != null) 'company': company!.toJson(),
    };
  }
}
