import 'package:student_hub/core/models/base_model.dart';

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

// class

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
  final String? id;
  final String? email;
  final String? name;
  final String? avatar;
  final String? country;
  final String? phone;
  final List<String>? roles;
  final dynamic language;
  final DateTime? birthday;
  final bool? isActivated;
  final TutorInfo? tutorInfo;
  final WalletInfo? walletInfo;
  final String? requireNote;
  final String? level;
  final List<dynamic>? learnTopics;
  final List<TestPreparation>? testPreparations;
  final bool? isPhoneActivated;
  final int? timezone;
  final ReferralInfo? referralInfo;
  final String? studySchedule;
  final bool? canSendMessage;
  final dynamic studentGroup;
  final dynamic studentInfo;
  final int? avgRating;

  User({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.language,
    this.birthday,
    this.isActivated,
    this.tutorInfo,
    this.walletInfo,
    this.requireNote,
    this.level,
    this.learnTopics,
    this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
    this.referralInfo,
    this.studySchedule,
    this.canSendMessage,
    this.studentGroup,
    this.studentInfo,
    this.avgRating,
  });

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? avatar,
    String? country,
    String? phone,
    List<String>? roles,
    dynamic language,
    DateTime? birthday,
    bool? isActivated,
    TutorInfo? tutorInfo,
    WalletInfo? walletInfo,
    String? requireNote,
    String? level,
    List<dynamic>? learnTopics,
    List<TestPreparation>? testPreparations,
    bool? isPhoneActivated,
    int? timezone,
    ReferralInfo? referralInfo,
    String? studySchedule,
    bool? canSendMessage,
    dynamic studentGroup,
    dynamic studentInfo,
    int? avgRating,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        country: country ?? this.country,
        phone: phone ?? this.phone,
        roles: roles ?? this.roles,
        language: language ?? this.language,
        birthday: birthday ?? this.birthday,
        isActivated: isActivated ?? this.isActivated,
        tutorInfo: tutorInfo ?? this.tutorInfo,
        walletInfo: walletInfo ?? this.walletInfo,
        requireNote: requireNote ?? this.requireNote,
        level: level ?? this.level,
        learnTopics: learnTopics ?? this.learnTopics,
        testPreparations: testPreparations ?? this.testPreparations,
        isPhoneActivated: isPhoneActivated ?? this.isPhoneActivated,
        timezone: timezone ?? this.timezone,
        referralInfo: referralInfo ?? this.referralInfo,
        studySchedule: studySchedule ?? this.studySchedule,
        canSendMessage: canSendMessage ?? this.canSendMessage,
        studentGroup: studentGroup ?? this.studentGroup,
        studentInfo: studentInfo ?? this.studentInfo,
        avgRating: avgRating ?? this.avgRating,
      );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      roles: json['roles'] != null
          ? (json['roles'] as List).map((e) => e as String).toList()
          : null,
      language: json['language'] as dynamic,
      birthday: json['birthday'] != null
          ? DateTime.tryParse(json['birthday'] as String)
          : null,
      isActivated: json['isActivated'] as bool?,
      tutorInfo: json['tutorInfo'] != null
          ? TutorInfo.fromJson(json['tutorInfo'] as Map<String, dynamic>)
          : null,
      walletInfo: json['walletInfo'] != null
          ? WalletInfo.fromJson(json['walletInfo'] as Map<String, dynamic>)
          : null,
      requireNote: json['requireNote'] as String?,
      level: json['level'] as String?,
      learnTopics: json['learnTopics'] != null
          ? (json['learnTopics'] as List).map((e) => e as dynamic).toList()
          : null,
      testPreparations: json['testPreparations'] != null
          ? (json['testPreparations'] as List)
              .map((e) => TestPreparation.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      isPhoneActivated: json['isPhoneActivated'] as bool?,
      timezone: json['timezone'] as int?,
      referralInfo: json['referralInfo'] != null
          ? ReferralInfo.fromJson(json['referralInfo'] as Map<String, dynamic>)
          : null,
      studySchedule: json['studySchedule'] as String?,
      canSendMessage: json['canSendMessage'] as bool?,
      studentGroup: json['studentGroup'] as dynamic,
      studentInfo: json['studentInfo'] as dynamic,
      avgRating: json['avgRating'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'avatar': avatar,
      'country': country,
      'phone': phone,
      'roles': roles,
      'language': language,
      'birthday': birthday?.toIso8601String(),
      'isActivated': isActivated,
      'tutorInfo': tutorInfo?.toJson(),
      'walletInfo': walletInfo?.toJson(),
      'requireNote': requireNote,
      'level': level,
      'learnTopics': learnTopics,
      'testPreparations':
          testPreparations?.map((e) => e.toJson()).toList(),
      'isPhoneActivated': isPhoneActivated,
      'timezone': timezone,
      'referralInfo': referralInfo?.toJson(),
      'studySchedule': studySchedule,
      'canSendMessage': canSendMessage,
      'studentGroup': studentGroup,
      'studentInfo': studentInfo,
      'avgRating': avgRating,
    };
  }
}

class ReferralInfo {
  final String? referralCode;
  final ReferralPackInfo? referralPackInfo;

  ReferralInfo({
    this.referralCode,
    this.referralPackInfo,
  });

  ReferralInfo copyWith({
    String? referralCode,
    ReferralPackInfo? referralPackInfo,
  }) =>
      ReferralInfo(
        referralCode: referralCode ?? this.referralCode,
        referralPackInfo: referralPackInfo ?? this.referralPackInfo,
      );

  factory ReferralInfo.fromJson(Map<String, dynamic> json) {
    return ReferralInfo(
      referralCode: json['referralCode'] as String?,
      referralPackInfo: json['referralPackInfo'] != null
          ? ReferralPackInfo.fromJson(
              json['referralPackInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'referralCode': referralCode,
      'referralPackInfo': referralPackInfo?.toJson(),
    };
  }
}

class ReferralPackInfo {
  final int? earnPercent;

  ReferralPackInfo({
    this.earnPercent,
  });

  ReferralPackInfo copyWith({
    int? earnPercent,
  }) =>
      ReferralPackInfo(
        earnPercent: earnPercent ?? this.earnPercent,
      );

  factory ReferralPackInfo.fromJson(Map<String, dynamic> json) {
    return ReferralPackInfo(
      earnPercent: json['earnPercent'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'earnPercent': earnPercent,
    };
  }
}

class TestPreparation {
  final int? id;
  final String? key;
  final String? name;

  TestPreparation({
    this.id,
    this.key,
    this.name,
  });

  TestPreparation copyWith({
    int? id,
    String? key,
    String? name,
  }) =>
      TestPreparation(
        id: id ?? this.id,
        key: key ?? this.key,
        name: name ?? this.name,
      );

  factory TestPreparation.fromJson(Map<String, dynamic> json) {
    return TestPreparation(
      id: json['id'] as int?,
      key: json['key'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'name': name,
    };
  }
}

class TutorInfo {
  final String? id;
  final String? video;
  final String? bio;
  final String? education;
  final String? experience;
  final String? profession;
  final dynamic accent;
  final String? targetStudent;
  final String? interests;
  final String? languages;
  final String? specialties;
  final dynamic resume;
  final double? rating;
  final bool? isActivated;
  final bool? isNative;
  final String? youtubeVideoId;

  TutorInfo({
    this.id,
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    this.accent,
    this.targetStudent,
    this.interests,
    this.languages,
    this.specialties,
    this.resume,
    this.rating,
    this.isActivated,
    this.isNative,
    this.youtubeVideoId,
  });

  TutorInfo copyWith({
    String? id,
    String? video,
    String? bio,
    String? education,
    String? experience,
    String? profession,
    dynamic accent,
    String? targetStudent,
    String? interests,
    String? languages,
    String? specialties,
    dynamic resume,
    double? rating,
    bool? isActivated,
    bool? isNative,
    String? youtubeVideoId,
  }) =>
      TutorInfo(
        id: id ?? this.id,
        video: video ?? this.video,
        bio: bio ?? this.bio,
        education: education ?? this.education,
        experience: experience ?? this.experience,
        profession: profession ?? this.profession,
        accent: accent ?? this.accent,
        targetStudent: targetStudent ?? this.targetStudent,
        interests: interests ?? this.interests,
        languages: languages ?? this.languages,
        specialties: specialties ?? this.specialties,
        resume: resume ?? this.resume,
        rating: rating ?? this.rating,
        isActivated: isActivated ?? this.isActivated,
        isNative: isNative ?? this.isNative,
        youtubeVideoId: youtubeVideoId ?? this.youtubeVideoId,
      );

  factory TutorInfo.fromJson(Map<String, dynamic> json) {
    return TutorInfo(
      id: json['id'] as String?,
      video: json['video'] as String?,
      bio: json['bio'] as String?,
      education: json['education'] as String?,
      experience: json['experience'] as String?,
      profession: json['profession'] as String?,
      accent: json['accent'] as dynamic,
      targetStudent: json['targetStudent'] as String?,
      interests: json['interests'] as String?,
      languages: json['languages'] as String?,
      specialties: json['specialties'] as String?,
      resume: json['resume'] as dynamic,
      rating: json['rating'] as double?,
      isActivated: json['isActivated'] as bool?,
      isNative: json['isNative'] as bool?,
      youtubeVideoId: json['youtubeVideoId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'video': video,
      'bio': bio,
      'education': education,
      'experience': experience,
      'profession': profession,
      'accent': accent,
      'targetStudent': targetStudent,
      'interests': interests,
      'languages': languages,
      'specialties': specialties,
      'resume': resume,
      'rating': rating,
      'isActivated': isActivated,
      'isNative': isNative,
      'youtubeVideoId': youtubeVideoId,
    };
  }
}

class WalletInfo {
  final String? amount;
  final bool? isBlocked;
  final int? bonus;

  WalletInfo({
    this.amount,
    this.isBlocked,
    this.bonus,
  });

  WalletInfo copyWith({
    String? amount,
    bool? isBlocked,
    int? bonus,
  }) =>
      WalletInfo(
        amount: amount ?? this.amount,
        isBlocked: isBlocked ?? this.isBlocked,
        bonus: bonus ?? this.bonus,
      );

  factory WalletInfo.fromJson(Map<String, dynamic> json) {
    return WalletInfo(
      amount: json['amount'] as String?,
      isBlocked: json['isBlocked'] as bool?,
      bonus: json['bonus'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'isBlocked': isBlocked,
      'bonus': bonus,
    };
  }
}