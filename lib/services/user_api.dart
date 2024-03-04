import 'dart:convert';

import 'package:e_commerce_rep/model/user.dart';
import 'package:e_commerce_rep/model/userdob.dart';
import 'package:e_commerce_rep/model/username.dart';
import 'package:http/http.dart' as http;

class UserAPI {
  static Future<List<User>> userData() async {
    const url = "https://randomuser.me/api/?results=10";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
          title: e['name']['title'],
          first: e['name']["first"],
          last: e['name']["last"]);
      final date = e['dob']['date'];
      final dob = UserDOB(date: DateTime.parse(date), age: e['dob']['age']);
      return User(
          email: e["email"],
          phone: e["phone"],
          cell: e["cell"],
          nat: e["nat"],
          gender: e["gender"],
          name: name,
          dob: dob);
    }).toList();
    return users;
  }
}
