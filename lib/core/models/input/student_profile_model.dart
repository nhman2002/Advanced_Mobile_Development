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