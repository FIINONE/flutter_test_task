import 'package:flutter_test_task/data/api/models/users/address.dart';
import 'package:flutter_test_task/data/api/models/users/company.dart';
import 'package:flutter_test_task/data/api/models/users/geo.dart';
import 'package:flutter_test_task/data/api/models/users/user.dart';
import 'package:flutter_test_task/domain/model/user.dart';

class UserMapper {
  static User mapper(ApiUser apiUser) {
    return User(
      id: apiUser.id!,
      name: apiUser.name!,
      username: apiUser.username!,
      address: AddressMapper.mapper(apiUser.address!),
      email: apiUser.email!,
      company: CompanyMapper.mapper(apiUser.company!),
      phone: apiUser.phone!,
      website: apiUser.website!,
    );
  }
}

class AddressMapper {
  static Address mapper(ApiAddress address) {
    return Address(
      city: address.city!,
      geo: GeoMapper.mapper(address.geo!),
      street: address.street!,
      suite: address.suite!,
      zipcode: address.zipcode!,
    );
  }
}

class GeoMapper {
  static Geo mapper(ApiGeo apiGeo) {
    return Geo(
      lat: apiGeo.lat!,
      lng: apiGeo.lng!,
    );
  }
}

class CompanyMapper {
  static Company mapper(ApiCompany apiCompany) {
    return Company(
      name: apiCompany.name!,
      bs: apiCompany.bs!,
      catchPhrase: apiCompany.catchPhrase!,
    );
  }
}
