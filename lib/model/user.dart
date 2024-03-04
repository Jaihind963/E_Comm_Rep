import 'package:e_commerce_rep/model/userdob.dart';
import 'package:e_commerce_rep/model/username.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDOB dob;
  User(
      {required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.gender,
      required this.name,
      required this.dob});

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
