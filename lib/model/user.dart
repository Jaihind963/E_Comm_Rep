import 'package:e_commerce_rep/model/location.dart';
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
  final Location location;
  User(
      {required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.gender,
      required this.name,
      required this.dob,
      required this.location});
  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e);
    final dob = UserDOB.fromMap(e['dob']);
    final location = Location.fromMap(e['location']);
    return User(
        email: e["email"],
        phone: e["phone"],
        cell: e["cell"],
        nat: e["nat"],
        gender: e["gender"],
        name: name,
        dob: dob,
        location: location);
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
