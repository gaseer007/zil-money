// import 'package:zilmoney_machine_test/models/user_depend_model.dart';
//
// import '../entities/user_entity.dart';
//
// class UserModel extends UserEntity {
//   final Address? address;
//   final Company? company;
//
//   UserModel({
//     required super.id,
//     required super.name,
//     required super.username,
//     required super.email,
//     required super.phone,
//     required super.website,
//     this.address,
//     this.company,
//   });
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'],
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
//   // Optional: If you want to send only what's needed for POST/PUT
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'username': username,
//       'email': email,
//       'phone': phone,
//       'website': website,
//       // Include these if your POST API accepts nested objects:
//       // 'address': address?.toJson(),
//       // 'company': company?.toJson(),
//     };
//   }
// }
