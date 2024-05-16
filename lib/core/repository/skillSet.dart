import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:student_hub/core/repository/base.dart';


class SkillSetRepository extends BaseRepository {
  SkillSetRepository() : super('/skillset');

  Future<DataState<SkillSetList>> getAll() async {
    return get<SkillSetList>(
      path: '/getAllSkillSet',
      parseJsonFunction: SkillSetList.fromJson,
    );
  }

}
