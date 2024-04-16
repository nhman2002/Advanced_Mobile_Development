
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/company_model.dart';
import 'package:student_hub/core/repository/base.dart';


class CompanyProfileRepository extends BaseRepository {
  CompanyProfileRepository() : super('/profile/company');

  Future<DataState<CompanyProfile>> inputCompanyProfile(CompanyProfile input) async {
    return post<CompanyProfile>(
      path: '',
      parseJsonFunction: CompanyProfile.fromJson,
      data: input.toJson(),
    );
  }

  Future<DataState<CompanyProfile>> editCompanyProlfile(CompanyProfile input, int id) async {
    return put<CompanyProfile>(
      path: '/$id',
      parseJsonFunction: CompanyProfile.fromJson,
      data: input.toJson(),
    );
  }


  Future<DataState<CompanyProfile>> getProfile(int id) async {
    return get<CompanyProfile>(
      path: '/$id',
      parseJsonFunction: CompanyProfile.fromJson,
    );
  }
}