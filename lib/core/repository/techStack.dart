import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:student_hub/core/repository/base.dart';


class TechStackRepository extends BaseRepository {
  TechStackRepository() : super('/TechStack');

  Future<DataState<TechStackList>> getAll() async {
    return get<TechStackList>(
      path: '/getAllTechStack',
      parseJsonFunction: TechStackList.fromJson,
    );
  }
}