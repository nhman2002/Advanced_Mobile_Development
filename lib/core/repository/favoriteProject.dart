
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/favorite_project_model.dart';
import 'package:student_hub/core/models/output/project_model.dart';
import 'package:student_hub/core/repository/base.dart';


class FavoriteProjectRepository extends BaseRepository {
  FavoriteProjectRepository() : super('/favoriteProject');

  Future<DataState<ProjectOutputList>> getFavoriteProjects(int id) async {
    return get<ProjectOutputList>(
      path: '/$id',
      parseJsonFunction: ProjectOutputList.fromJson,
    );
  }

  Future<DataState<ProjectOutput>> favoriteProject(int id,FavoriteProjectForm form) async {
    return patch<ProjectOutput>(
      path: '/%id',
      parseJsonFunction: ProjectOutput.fromJson2,
      data: form.toJson(),
    );
  }


}
