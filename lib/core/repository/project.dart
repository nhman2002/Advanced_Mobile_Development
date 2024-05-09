import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/project_post_model.dart';
import 'package:student_hub/core/models/output/project_model.dart';
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

  Future<DataState<ProjectPostForm>> updateProject(int id, ProjectPostForm input) async {
    return patch<ProjectPostForm>(
      path: '/$id',
      parseJsonFunction: ProjectPostForm.fromJson,
      data: input.toJson(),
    );
  }

  Future<DataState<ProjectPostForm>> deleteProject(int id) async {
    return delete<ProjectPostForm>(
      path: '/$id',
      parseJsonFunction: ProjectPostForm.fromJson,
    );
  }
//https://api.studenthub.dev/api/project?title=2&projectScopeFlag=2&numberOfStudents=2&proposalsLessThan=2&page=2&perPage=10
//all field can be null
  Future<DataState<ProjectOutputList>> filterProject(String? title, int? projectScope, int? numberOfStudents, int? projectType, int? page, int? perPage) async {
    String path = '';

    if (title != null || projectScope != null || numberOfStudents != null || projectType != null || page != null || perPage != null) {
      path += '?';
    }
    if (title != null) {
      path += 'title=$title';
    }
    if (projectScope != null) {
      if (title != null) {
        path += '&';
      }
      path += 'projectScopeFlag=$projectScope';
    }
    if (numberOfStudents != null) {
      if (title != null || projectScope != null) {
        path += '&';
      }
      path += 'numberOfStudents=$numberOfStudents';
    }
    if (projectType != null) {
      if (title != null || projectScope != null || numberOfStudents != null) {
        path += '&';
      }
      path += 'projectType=$projectType';
    }
    if (page != null) {
      if (title != null || projectScope != null || numberOfStudents != null || projectType != null) {
        path += '&';
      }
      path += 'page=$page';
    }

    
    return get<ProjectOutputList>(
      path: path,
      parseJsonFunction: ProjectOutputList.fromJson,
    );
  }


}