class TechStackForm {


  //   "techStackId": {},
  // "skillSets": [
  //   "string"
  // ]
  final int? techStackId;
  final List<String>? skillSets;

  TechStackForm({
    this.techStackId,
    this.skillSets,
  });

  factory TechStackForm.fromJson(Map<String, dynamic> json) {
    return TechStackForm(
      techStackId: json['techStackId'] as int?,
      skillSets: (json['skillSets'] as List?)?.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['techStackId'] = techStackId;
    map['skillSets'] = skillSets;
    return map;
  }

  TechStackForm copyWith({
    int? techStackId,
    List<String>? skillSets,
  }) =>
      TechStackForm(
        techStackId: techStackId ?? this.techStackId,
        skillSets: skillSets ?? this.skillSets,
      );
 

}


      // "schoolName": "string",
      // "startYear": 212,
      // "endYear": 233
class EducationInput{
  final String? schoolName;
  final int? startYear;
  final int? endYear;

  EducationInput({
    this.schoolName,
    this.startYear,
    this.endYear,
  });

  factory EducationInput.fromJson(Map<String, dynamic> json) {
    return EducationInput(
      schoolName: json['schoolName'] as String?,
      startYear: json['startYear'] as int?,
      endYear: json['endYear'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['schoolName'] = schoolName;
    map['startYear'] = startYear;
    map['endYear'] = endYear;
    return map;
  }

  EducationInput copyWith({
    String? schoolName,
    int? startYear,
    int? endYear,
  }) =>
      EducationInput(
        schoolName: schoolName ?? this.schoolName,
        startYear: startYear ?? this.startYear,
        endYear: endYear ?? this.endYear,
    );

}

      // "title": "string",
      // "startMonth": "string",
      // "endMonth": "string",
      // "description": "string",
      // "skillSets": [
      //   "string"

class ExperienceInput{
  final String? title;
  final String? startMonth;
  final String? endMonth;
  final String? description;
  final List<String>? skillSets;

  ExperienceInput({
    this.title,
    this.startMonth,
    this.endMonth,
    this.description,
    this.skillSets,
  });

  factory ExperienceInput.fromJson(Map<String, dynamic> json) {
    return ExperienceInput(
      title: json['title'] as String?,
      startMonth: json['startMonth'] as String?,
      endMonth: json['endMonth'] as String?,
      description: json['description'] as String?,
      skillSets: (json['skillSets'] as List?)?.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['startMonth'] = startMonth;
    map['endMonth'] = endMonth;
    map['description'] = description;
    map['skillSets'] = skillSets;
    return map;
  }

  ExperienceInput copyWith({
    String? title,
    String? startMonth,
    String? endMonth,
    String? description,
    List<String>? skillSets,
  }) =>
      ExperienceInput(
        title: title ?? this.title,
        startMonth: startMonth ?? this.startMonth,
        endMonth: endMonth ?? this.endMonth,
        description: description ?? this.description,
        skillSets: skillSets ?? this.skillSets,
    );

    

}

// {
//   "languages": [
//     {
//       "languageName": "engrish",
//       "level": "high"
//     }
//   ]
class LanguageInput{
  final String? languageName;
  final String? level;

  LanguageInput({
    this.languageName,
    this.level,
  });

  factory LanguageInput.fromJson(Map<String, dynamic> json) {
    return LanguageInput(
      languageName: json['languageName'] as String?,
      level: json['level'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['languageName'] = languageName;
    map['level'] = level;
    return map;
  }

  LanguageInput copyWith({
    String? languageName,
    String? level,
  }) =>
      LanguageInput(
        languageName: languageName ?? this.languageName,
        level: level ?? this.level,
    );
} 

class LanguageList {
  final List<LanguageInput>? languages;

  LanguageList({
    this.languages,
  });

  factory LanguageList.fromJson(Map<String, dynamic> json) {
    var list = json['languages'] as List<dynamic>;
    List<LanguageInput> languageInputs =
        list.map((e) => LanguageInput.fromJson(e)).toList();

    return LanguageList(
      languages: languageInputs,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'languages': languages?.map((e) => e.toJson()).toList(),
    };
    return data;
  }

  LanguageList copyWith({
    List<LanguageInput>? languages,
  }) =>
      LanguageList(
        languages: languages ?? this.languages,
      );
}

class ExperienceList {
  final List<ExperienceInput>? experiences;

  ExperienceList({
    this.experiences,
  });

  factory ExperienceList.fromJson(Map<String, dynamic> json) {
    var list = json['experiences'] as List<dynamic>;
    List<ExperienceInput> experienceInputs =
        list.map((e) => ExperienceInput.fromJson(e)).toList();

    return ExperienceList(
      experiences: experienceInputs,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'experience': experiences?.map((e) => e.toJson()).toList(),
    };
    return data;
  }

  ExperienceList copyWith({
    List<ExperienceInput>? experiences,
  }) =>
      ExperienceList(
        experiences: experiences ?? this.experiences,
      );
}


class EducationList {
  final List<EducationInput>? educations;

  //translate from List<EducationInput> to EducationList

  

  EducationList({
    this.educations,
  });

  factory EducationList.fromJson(Map<String, dynamic> json) {
    var list = json['educations'] as List<dynamic>;
    List<EducationInput> educationInputs =
        list.map((e) => EducationInput.fromJson(e)).toList();

    return EducationList(
      educations: educationInputs,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'education': educations?.map((e) => e.toJson()).toList(),
    };
    return data;
  }

  EducationList copyWith({
    List<EducationInput>? educations,
  }) =>
      EducationList(
        educations: educations ?? this.educations,
      );
}
