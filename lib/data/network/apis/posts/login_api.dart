import 'dart:async';

import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/models/user/user.dart';

class PostApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  PostApi(this._dioClient);

  Future<User> login(String email, String password) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "password": password,
      };
      final res = await _dioClient.post(Endpoints.loginUser, data: data);
      return User.fromJson(res);
    } catch (e) {
      print(e);
      return User();
    }
  }
}
