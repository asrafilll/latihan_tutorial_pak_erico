import 'dart:convert';

import 'package:http/http.dart' as http;

class CreateUser {
  late String email;
  late String password;
  late int id;
  late String token;

  CreateUser({required this.id, required this.token});

  factory CreateUser.createUserResult(Map<dynamic, dynamic> object) {
    return CreateUser(id: object['id'], token: object['token']);
  }

  static Future<CreateUser> connectToAPI(String email, String password) async {
    var apiResult = await http.post(
      Uri.parse('https://reqres.in/api/register'),
      body: {
        'email': email,
        'password': password,
      },
    );

    var jsonObject = json.decode(apiResult.body);
    return CreateUser.createUserResult(jsonObject);
  }
}
