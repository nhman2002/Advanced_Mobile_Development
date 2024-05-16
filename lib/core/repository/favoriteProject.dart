
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/favorite_project_model.dart';
import 'package:student_hub/core/models/output/project_model.dart';
import 'package:student_hub/core/models/output/user_model.dart';
import 'package:student_hub/core/repository/base.dart';


class FavoriteProjectRepository extends BaseRepository {
  FavoriteProjectRepository() : super('/favoriteProject');

  Future<DataState<ProjectOutputList>> getFavoriteProjects(int id) async {
    return get<ProjectOutputList>(
      path: '/$id',
      parseJsonFunction: ProjectOutputList.fromJson2,
    );
  }

  Future<DataState<Message>> favoriteProject(int id,FavoriteProjectForm form) async {
    return patch<Message>(
      path: '/$id',
      parseJsonFunction: Message.fromJson,
      data: form.toJson(),
    );
  }


}
