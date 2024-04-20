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

      companyName: json['companyName'] as String?,
      website: json['website'] as String?,
      description: json['description'] as String?,
      size: json['size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
