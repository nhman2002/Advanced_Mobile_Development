
import 'package:student_hub/core/models/base_model.dart';
import 'package:student_hub/core/models/output/student_profile.dart';

class LoginOutput extends BaseModel {
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
  StudentProfileWithoutDate? studentProfile;
  CompanyProfile? companyProfile;

  User({
    this.id,
    this.email,
    this.password,
    this.fullname,
    this.role,
    this.studentProfile,
    this.companyProfile,
  });

  User copyWith({
    int? id,
    String? email,
    String? password,
    String? fullname,
    List<dynamic>? role,
    StudentProfileWithoutDate? studentUser,
    CompanyProfile? companyUser,
    List<String>? studentProfile,
    List<String>? companyProfile,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
        fullname: fullname ?? this.fullname,
        role: role ?? this.role,
        studentProfile:
            studentProfile as StudentProfileWithoutDate? ?? this.studentProfile,
        companyProfile:
            companyProfile as CompanyProfile? ?? this.companyProfile,
      );

  Map<String, dynamic> toMapUser() => {
        'id': id,
        'email': email,
        'password': password,
        'fullname': fullname,
        'role': role,
        'studentProfile': studentProfile ?? 'null',
        'companyProfile': companyProfile ?? 'null',
      };

  factory User.fromMapUser(Map<String, dynamic> map) => User(
        id: map['id'],
        email: map['email'],
        password: map['password'],
        fullname: map['fullname'],
        role: map['role'],
        studentProfile: map['studentProfile'],
        companyProfile: map['companyProfile'],
      );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['result']['id'] as int,
      fullname: json['result']['fullname'] as String?,
      role: List<int>.from(json['result']['roles'] as List),
      studentProfile: json['result']['student'] != null
          ? StudentProfileWithoutDate.fromJson(
              json['result']['student'] as Map<String, dynamic>)
          : null,
      companyProfile: json['result']['company'] != null
          ? CompanyProfile.fromJson(
              json['result']['company'] as Map<String, dynamic>)
          : null,
      // studentUser: json['student'] != null
      //     ? StudentProfileWithoutDate.fromJson(json['student'] as Map<String, dynamic>)
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

// student: {id: 256, createdAt: 2024-05-15T04:53:58.181Z, updatedAt: 2024-05-15T04:54:08.243Z, deletedAt: null, userId: 440, techStackId: 8, resume: resumes/1715748848203-BHXH_da98ba799ce64b2f9266f22371811e552398325.pdf, transcript: null, proposals: [], techStack: {id: 8, createdAt: 2024-04-13T16:04:24.196Z, updatedAt: 2024-04-13T16:04:24.196Z, deletedAt: null, name: Software Engineer}, educations: [{id: 514, createdAt: 2024-05-15T04:54:14.989Z, updatedAt: 2024-05-15T04:54:14.989Z, deletedAt: null, studentId: 256, schoolName: hcmus, startYear: 2022, endYear: 2025}], languages: [{id: 943, createdAt: 2024-05-15T04:54:12.771Z, updatedAt: 2024-05-15T04:54:12.771Z, deletedAt: null, studentId: 256, languageName: Spanish, level: Intermediate}], experiences: [{id: 386, createdAt: 2024-05-15T04:54:10.618Z, updatedAt: 2024-05-15T04:54:10.618Z, deletedAt: null, studentId: 256, title: wow, startMonth: 05-2022, endMonth: 05-2024, description: projevt, skillSets: [{id: 1, createdAt: 2024-04-08T00:58:11.238Z, updatedAt: 2024-04-08T00:58:11.238Z, deletedAt: null, name: C}, {id: 2, createdAt: 2024-04-08T00:58:11.256Z, updatedAt: 2024-04-08T00:58:11.256Z, deletedAt: null, name: C++}]}], skillSets: [{id: 2, createdAt: 2024-04-08T00:58:11.256Z, updatedAt: 2024-04-08T00:58:11.256Z, deletedAt: null, name: C++}, {id: 3, createdAt: 2024-04-08T00:58:11.263Z, updatedAt: 2024-04-08T00:58:11.263Z, deletedAt: null, name: C#}]},
///create student profile from this

class StudentProfileWithoutDate {
  final int? id;
  final int? userId;
  final int? techStackId;
  final String? resume;
  final String? transcript;
  final TechStack? techStack;
  final List<Education>? educations;
  final List<Language>? languages;
  final List<Experience>? experiences;
  final List<SkillSet>? skillSets;


  StudentProfileWithoutDate({
    this.id,
    this.userId,
    this.techStackId,
    this.resume,
    this.transcript,
    this.techStack,
    this.educations,
    this.languages,
    this.experiences,
    this.skillSets,
  });

  StudentProfileWithoutDate copyWith({
    int? id,
    int? userId,
    int? techStackId,
    String? resume,
    String? transcript,
    TechStack? techStack,
    List<Education>? educations,
    List<Language>? languages,
    List<Experience>? experiences,
    List<SkillSet>? skillSets,
  }) =>
      StudentProfileWithoutDate(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        techStackId: techStackId ?? this.techStackId,
        resume: resume ?? this.resume,
        transcript: transcript ?? this.transcript,
        techStack: techStack ?? this.techStack,
        educations: educations ?? this.educations,
        languages: languages ?? this.languages,
        experiences: experiences ?? this.experiences,
        skillSets: skillSets ?? this.skillSets,
      );

  factory StudentProfileWithoutDate.fromJson(Map<String, dynamic> json1) {
    Map<String, dynamic> json;
    if (json1['result'] == null){
      json = json1;
    }
    else{
      json = json1['result'];
    }
    return StudentProfileWithoutDate(
      id: json['id'] as int,
      userId: json['userId'] as int,
      techStackId: json['techStack']['id'] as int,
      resume: json['resume'] as String?,
      transcript: json['transcript'] as String?,
      techStack: json['techStack'] != null
          ? TechStack.fromJson(json['techStack'] as Map<String, dynamic>)
          : null,
      educations: json['educations'] != null
          ? List<Education>.from(
              json['educations'].map((x) => Education.fromJson(x)))
          : [],
      languages: json['languages'] != null
          ? List<Language>.from(
              json['languages'].map((x) => Language.fromJson(x)))
          : [],
      experiences: json['experiences'] != null
          ? List<Experience>.from(
              json['experiences'].map((x) => Experience.fromJson(x)))
          : [],

      skillSets: json['skillSets'] != null
          ? List<SkillSet>.from(
              json['skillSets'].map((x) => SkillSet.fromJson(x)))
          : [],
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'techStackId': techStackId,
      'resume': resume,
      'transcript': transcript,
      'techStack': techStack,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'techStackId': techStackId,
      'resume': resume,
      'transcript': transcript,
      'techStack': techStack?.toMap(),
    };
  }

  factory StudentProfileWithoutDate.fromMap(Map<String, dynamic> map) {
    return StudentProfileWithoutDate(
      id: map['id'],
      userId: map['userId'],
      techStackId: map['techStackId'],
      resume: map['resume'],
      transcript: map['transcript'],
      techStack: TechStack.fromMap(map['techStack']),
    );
  }
}

// class TechStack {
//   final int? id;
//   final String? name;

//   TechStack({
//     this.id,
//     this.name,
//   });

//   TechStack copyWith({
//     int? id,
//     String? name,
//   }) =>
//       TechStack(
//         id: id ?? this.id,
//         name: name ?? this.name,
//       );

//   factory TechStack.fromJson(Map<String, dynamic> json) {
//     return TechStack(
//       id: json['id'] as int,
//       name: json['name'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//     };
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//     };
//   }

//   factory TechStack.fromMap(Map<String, dynamic> map) {
//     return TechStack(
//       id: map['id'],
//       name: map['name'],
//     );
//   }
// }

class CompanyProfile {
  final int? id;
  final String? companyName;
  final String? website;
  final String? description;
  final int? size;

  CompanyProfile({
    this.id,
    this.companyName,
    this.website,
    this.description,
    this.size,
  });

  factory CompanyProfile.fromJson(Map<String, dynamic> json) {
    return CompanyProfile(
      id: json['id'] as int,
      companyName: json['companyName'] as String?,
      website: json['website'] as String?,
      description: json['description'] as String?,
      size: json['size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['companyName'] = companyName;
    map['website'] = website;
    map['description'] = description;
    map['size'] = size;
    return map;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'companyName': companyName,
      'website': website,
      'description': description,
      'size': size,
    };
  }

  factory CompanyProfile.fromMap(Map<String, dynamic> map) {
    return CompanyProfile(
      id: map['id'],
      companyName: map['companyName'],
      website: map['website'],
      description: map['description'],
      size: map['size'],
    );
  }

  CompanyProfile copyWith({
    int? id,
    String? companyName,
    String? website,
    String? description,
    int? size,
  }) =>
      CompanyProfile(
        id: id ?? this.id,
        companyName: companyName ?? this.companyName,
        website: website ?? this.website,
        description: description ?? this.description,
        size: size ?? this.size,
      );
}

class Message extends BaseModel {
  final String? message;

  Message({
    this.message,
  });

  Message copyWith({
    String? message,
  }) =>
      Message(
        message: message ?? this.message,
      );

  @override
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json['message'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
