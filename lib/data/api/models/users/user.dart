import 'package:flutter_test_task/data/api/models/users/address.dart';
import 'package:flutter_test_task/data/api/models/users/company.dart';

class ApiUser {
  int? id;
  String? name;
  String? username;
  String? email;
  ApiAddress? address;
  String? phone;
  String? website;
  ApiCompany? company;

  ApiUser({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory ApiUser.fromJson(Map<String, dynamic> json) => ApiUser(
        id: json['id'] as int?,
        name: json['name'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        address: json['address'] == null
            ? null
            : ApiAddress.fromJson(json['address'] as Map<String, dynamic>),
        phone: json['phone'] as String?,
        website: json['website'] as String?,
        company: json['company'] == null
            ? null
            : ApiCompany.fromJson(json['company'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'address': address?.toJson(),
        'phone': phone,
        'website': website,
        'company': company?.toJson(),
      };
}
