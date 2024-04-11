import 'package:student_hub/core/models/output/company_user.dart';
import 'package:student_hub/core/models/output/student_profile.dart';

class User {
  final int? id;
  final String? email;
  final String? password;
  final String? fullname;
  final List<dynamic>? role;
  StudentProfile? studentUser;
  CompanyProfile? companyUser;

  User({
    this.id,
    this.email,
    this.password,
    this.fullname,
    this.role,
    this.studentUser,
    this.companyUser,
  });

  Map<String, dynamic> toMapUser() => {
        'id': id,
        'email': email,
        'password': password,
        'fullname': fullname,
        'role': role,
        'student': studentUser?.toMap(),
        'company': companyUser?.toMap(),
      };

  factory User.fromMapUser(Map<String, dynamic> map) => User(
        id: map['id'],
        email: map['email'],
        password: map['password'],
        fullname: map['fullname'],
        role: map['role'],
        studentUser: map['student'] == null
            ? null
            : StudentProfile.fromMap(map['student']),
        companyUser: map['company'] == null
            ? null
            : CompanyProfile.fromMap(map['company']),
      );
}
