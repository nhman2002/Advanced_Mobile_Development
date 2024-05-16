class OutputCompanyProfile {
  final int? id;
  final String? companyName;
  final String? website;
  final String? description;
  final int? size;


  OutputCompanyProfile({
    this.id,
    this.companyName,
    this.website,
    this.description,
    this.size,

  });



  factory OutputCompanyProfile.fromJson(Map<String, dynamic> json) {
    return OutputCompanyProfile(
      id: json['result']['id'] as int?,

      companyName: json['result']['companyName'] as String?,
      website: json['result']['website'] as String?,
      description: json['result']['description'] as String?,
      size: json['result']['size'] as int?,

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

  factory OutputCompanyProfile.fromMap(Map<String, dynamic> map) {
    return OutputCompanyProfile(
      id: map['id'],
      companyName: map['companyName'],
      website: map['website'],
      description: map['description'],
      size: map['size'],
    );
  }

  OutputCompanyProfile copyWith({
    int? id,
    String? companyName,
    String? website,
    String? description,
    int? size,
  }) =>
      OutputCompanyProfile(
        id: id ?? this.id,
        companyName: companyName ?? this.companyName,
        website: website ?? this.website,
        description: description ?? this.description,
        size: size ?? this.size,
      );
}
