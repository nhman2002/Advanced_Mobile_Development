import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/login_model.dart';
import 'package:student_hub/core/models/input/project_post_model.dart';

import 'package:student_hub/core/models/input/register_model.dart';
import 'package:student_hub/core/models/output/user_model.dart';
import 'package:student_hub/core/repository/base.dart';


class ProjectRepository extends BaseRepository {
  ProjectRepository() : super('/project');

  Future<DataState<ProjectPostForm>> projectPost(ProjectPostForm input) async {
    return post<ProjectPostForm>(
      path: '',
      parseJsonFunction: ProjectPostForm.fromJson,
      data: input.toJson(),
    );
  }
}