import 'dart:convert';
import 'package:bloc_network_example/model/user_model.dart';
import 'package:dio/dio.dart';

class UserApiProvider {
  Future<List<User>> getUsers() async {
    final dio = Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users');
    if (response.statusCode == 200) {
      List<User> list = (response.data as List<dynamic>)
          .map((e) => User.fromJson((e as Map<String, dynamic>)))
          .toList();
      return list;
    } else {
      throw Exception('Error fetching users');
    }
  }

  Future<List<User>> getUsersTest() async {
    final dio = Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users');
    if (response.statusCode == 200) {
      List<User> list = (response.data as List<dynamic>)
          .map((e) => User.fromJson((e as Map<String, dynamic>)))
          .toList();
      return list;
    } else {
      throw Exception('Error fetching users');
    }
  }
}
