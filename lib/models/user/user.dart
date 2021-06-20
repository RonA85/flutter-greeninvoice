import 'dart:collection';

import 'package:boilerplate/models/business/business.dart';
import 'package:boilerplate/utils/helper.dart';

class User {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? idNumber;
  String? createdAt;

  //List<Business>? businessList;
  BusinessList? businessList;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.idNumber,
    this.createdAt,
    this.businessList,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phone: json['phone'],
        idNumber: json['idNumber'],
        createdAt: formatTimestamp(json['signUpDate']),
        businessList: BusinessList.fromJson(json['businesses']));
  }

  String fullName() {
    return "$firstName $lastName";
  }

}

class BusinessList {
  final List<Business>? business;

  BusinessList({
    this.business,
  });

  factory BusinessList.fromJson(List<dynamic> json) {
    List<Business> posts = <Business>[];
    posts = json.map((post) => Business.fromMap(post)).toList();

    return BusinessList(
      business: posts,
    );
  }
}
