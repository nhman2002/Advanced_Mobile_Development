import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/login_model.dart';
import 'package:student_hub/core/models/input/project_post_model.dart';
import 'package:student_hub/core/models/input/proposal_model.dart';

import 'package:student_hub/core/models/input/register_model.dart';
import 'package:student_hub/core/models/output/project_model.dart';
import 'package:student_hub/core/models/output/user_model.dart';
import 'package:student_hub/core/repository/base.dart';


class ProposalRepository extends BaseRepository {
  ProposalRepository() : super('/proposal');

  //Create a new Proposal
  Future<DataState<ProposalPostForm>> proposalPost(ProposalPostForm input) async {
    return post<ProposalPostForm>(
      path: '',
      parseJsonFunction: ProposalPostForm.fromJson,
      data: input.toJson(),
    );
  }

}

