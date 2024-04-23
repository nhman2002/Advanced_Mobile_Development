 
 	
// "{
//   "projectId": 2,
//   "disableFlag": 1
// }"


class FavoriteProjectForm{
  final int? projectId;
  final int? disableFlag;

  FavoriteProjectForm({
    this.projectId,
    this.disableFlag,
  });

  factory FavoriteProjectForm.fromJson(Map<String, dynamic> json) {
    return FavoriteProjectForm(
      projectId: json['projectId'] as int?,
      disableFlag: json['disableFlag'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['projectId'] = projectId;
    map['disableFlag'] = disableFlag;
    return map;
  }

  FavoriteProjectForm copyWith({
    int? projectId,
    int? disableFlag,
  }) =>
      FavoriteProjectForm(
        projectId: projectId ?? this.projectId,
        disableFlag: disableFlag ?? this.disableFlag,
      );
}