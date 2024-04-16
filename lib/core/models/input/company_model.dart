class CompanyProfile {
  final String? companyName;
  final String? website;
  final String? description;
  final int? size;

  CompanyProfile({
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

  CompanyProfile copyWith({
    String? companyName,
    String? website,
    String? description,
    int? size,
  }) =>
      CompanyProfile(
        companyName: companyName ?? this.companyName,
        website: website ?? this.website,
        description: description ?? this.description,
        size: size ?? this.size,
      );
}
