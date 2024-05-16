
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/company_model.dart';
import 'package:student_hub/core/models/output/company_model.dart';
import 'package:student_hub/core/repository/base.dart';


class CompanyProfileRepository extends BaseRepository {
  CompanyProfileRepository() : super('/profile/company');

  Future<DataState<OutputCompanyProfile>> inputCompanyProfile(InputCompanyProfile input) async {
    return post<OutputCompanyProfile>(
      path: '',
      parseJsonFunction: OutputCompanyProfile.fromJson,
      data: input.toJson(),
    );
  }

  Future<DataState<InputCompanyProfile>> editCompanyProlfile(InputCompanyProfile input, int id) async {
    return put<InputCompanyProfile>(
      path: '/$id',
      parseJsonFunction: InputCompanyProfile.fromJson,
      data: input.toJson(),
    );
  }


  Future<DataState<OutputCompanyProfile>> getProfile(int id) async {
    return get<OutputCompanyProfile>(
      path: '/$id',
      parseJsonFunction: OutputCompanyProfile.fromJson,
    );
  }
}