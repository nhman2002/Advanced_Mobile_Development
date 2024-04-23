import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/login_model.dart';
import 'package:student_hub/core/models/input/project_post_model.dart';

import 'package:student_hub/core/models/input/register_model.dart';
import 'package:student_hub/core/models/output/project_model.dart';
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

  Future<DataState<ProjectOutputList>> getCompanyProjects(int id) async {
    return get<ProjectOutputList>(
      path: '/company/$id',
      parseJsonFunction: ProjectOutputList.fromJson,
    );
  }

  Future<DataState<ProjectOutputList>> getAllProjects() async {
    return get<ProjectOutputList>(
      path: '',
      parseJsonFunction: ProjectOutputList.fromJson,
    );
  }

  Future<DataState<ProjectOutput>> getProject(int id) async {
    return get<ProjectOutput>(
      path: '/$id',
      parseJsonFunction: ProjectOutput.fromJson2,
    );
  }

}