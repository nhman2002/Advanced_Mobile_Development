import 'package:student_hub/core/models/base_model.dart';
import 'package:student_hub/core/models/output/company_user.dart';
import 'package:student_hub/core/models/output/student_profile.dart';

class LoginOutput extends BaseModel{
  final User? user;
  final Token? token;

  LoginOutput({
    this.user,
    this.token,
  });

  LoginOutput copyWith({
    User? user,
    Token? token,
  }) =>
      LoginOutput(
        user: user ?? this.user,
        token: token ?? this.token,
      );

  @override
  factory LoginOutput.fromJson(Map<String, dynamic> json) {
    return LoginOutput(
      user: json['user'] != null
          ? User.fromJson(json['email'] as Map<String, dynamic>)
          : null,
      token: json['result'] != null
          ? Token.fromJson(json['result'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'token': token?.toJson(),
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    user,
    token,
  ];
}



class Token {
  final String? token;
  final DateTime? expires;

  Token({
    this.token,
    this.expires,
  });

  Token copyWith({
    String? token,
    DateTime? expires,
  }) =>
      Token(
        token: token ?? this.token,
        expires: expires ?? this.expires,
      );

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      token: json['token'] as String?,
      expires: json['expires'] != null
          ? DateTime.tryParse(json['expires'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expires': expires?.toIso8601String(),
    };
  }
}

// class token {
//   final Access? access;
//   // final Access? refresh;

//   token({
//     this.access,
//     // this.refresh,
//   });

//   token copyWith({
//     Access? access,
//     // Access? refresh,
//   }) =>
//       token(
//         access: access ?? this.access,
//         // refresh: refresh ?? this.refresh,
//       );

//   factory token.fromJson(Map<String, dynamic> json) {
//     return token(
//       access: json['access'] != null
//           ? Access.fromJson(json['access'] as Map<String, dynamic>)
//           : null,
//       // refresh: json['refresh'] != null
//       //     ? Access.fromJson(json['refresh'] as Map<String, dynamic>)
//       //     : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'access': access?.toJson(),
//       // 'refresh': refresh?.toJson(),
//     };
//   }
// }

// class Access {
//   final String? token;
//   final DateTime? expires;

//   Access({
//     this.token,
//     this.expires,
//   });

//   Access copyWith({
//     String? token,
//     DateTime? expires,
//   }) =>
//       Access(
//         token: token ?? this.token,
//         expires: expires ?? this.expires,
//       );

//   factory Access.fromJson(Map<String, dynamic> json) {
//     return Access(
//       token: json['token'] as String?,
//       expires: json['expires'] != null
//           ? DateTime.tryParse(json['expires'] as String)
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'token': token,
//       'expires': expires?.toIso8601String(),
//     };
//   }
// }
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

  User copyWith({
    int? id,
    String? email,
    String? password,
    String? fullname,
    List<dynamic>? role,
    StudentProfile? studentUser,
    CompanyProfile? companyUser,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
        fullname: fullname ?? this.fullname,
        role: role ?? this.role,
        studentUser: studentUser ?? this.studentUser,
        companyUser: companyUser ?? this.companyUser,
      );

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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['result']['id'] as int,
      fullname: json['result']['fullname'] as String?,
      role: List<int>.from(json['result']['roles'] as List),
      // studentUser: json['student'] != null
      //     ? StudentProfile.fromJson(json['student'] as Map<String, dynamic>)
      //     : null,
      // companyUser: json['company'] != null
      //     ? CompanyProfile.fromJson(json['company'] as Map<String, dynamic>)
      //     : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'fullname': fullname,
      'role': role,
      // 'student': studentUser?.toJson(),
      // 'company': companyUser?.toJson(),
    };
  }
    
}