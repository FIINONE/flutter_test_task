import 'package:flutter_test_task/data/api/models/users/geo.dart';

class ApiAddress {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  ApiGeo? geo;

  ApiAddress({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory ApiAddress.fromJson(Map<String, dynamic> json) => ApiAddress(
        street: json['street'] as String?,
        suite: json['suite'] as String?,
        city: json['city'] as String?,
        zipcode: json['zipcode'] as String?,
        geo: json['geo'] == null
            ? null
            : ApiGeo.fromJson(json['geo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
        'geo': geo?.toJson(),
      };
}
