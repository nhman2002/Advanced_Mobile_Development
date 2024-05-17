import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/proposal_model.dart';

import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:student_hub/core/repository/base.dart';

class ProposalRepository extends BaseRepository {
  ProposalRepository() : super('/proposal');

  //Create a new Proposal
  Future<DataState<ProposalPostForm>> proposalPost(
      ProposalPostForm input) async {
    return post<ProposalPostForm>(
      path: '',
      parseJsonFunction: ProposalPostForm.fromJson,
      data: input.toJson(),
    );
  }

  //get proposal by projectid
  Future<DataState<List<ProjectProposalOutput>>> getProposalByProjectId(
      int id) async {
    return get<List<ProjectProposalOutput>>(
      path: '/getByProjectId/$id',
      parseJsonFunction: ProjectProposalOutput.fromJsonList,
    );
  }

  //get and filter proposal based on http://localhost:4400/api/proposal/getByProjectId/1?q=q&offset=0&limit=100&order=1&statusFlag=1

  Future<DataState<List<ProjectProposalOutput>>> getFilteredProposalByProjectId(
      int id,
      String? query,
      int? offset,
      int? limit,
      int? order,
      int? statusFlag) async {
    // Initialize the base URL with the mandatory ID field
    String baseUrl = '/getByProjectId/$id';

    // Initialize an empty list for query parameters
    List<String> queryParams = [];

    // Add each parameter to the query list only if it is not null
    if (query != null) queryParams.add('q=$query');
    if (offset != null) queryParams.add('offset=$offset');
    if (limit != null) queryParams.add('limit=$limit');
    if (order != null) queryParams.add('order=$order');
    if (statusFlag != null) queryParams.add('statusFlag=$statusFlag');

    // Join all parameters with '&' to form the final query string, only add if there are any parameters
    String queryString =
        queryParams.isNotEmpty ? '?${queryParams.join('&')}' : '';

    // Combine the base URL with the query string
    String fullUrl = '$baseUrl$queryString';

    // Make the GET request with the constructed URL
    return get<List<ProjectProposalOutput>>(
      path: fullUrl,
      parseJsonFunction: ProjectProposalOutput.fromJsonList,
    );
  }

  //Get all Proposals
  Future<DataState<List<ProposalWithProject>>> getStudentProposal(
      int id, int flag) async {
    return get<List<ProposalWithProject>>(
      path: '/project/$id?statusFlag=$flag',
      parseJsonFunction: ProposalWithProject.fromJsonList,
    );
  }

  Future<DataState<List<ProposalWithProject>>> getStudentProposalWithTypeFlag(
      int id, int flag) async {
    return get<List<ProposalWithProject>>(
      path: '/project/$id?typeFlag=$flag',
      parseJsonFunction: ProposalWithProject.fromJsonList,
    );
  }

  Future<DataState<List<Proposal>>> getAllStudentProposals(int id) async {
    return get<List<Proposal>>(
      path: '/student/$id',
      parseJsonFunction: Proposal.fromJsonList,
    );
  }

  //Update a Proposal
  Future<DataState<ProposalPatchForm>> updateProposal(
      int id, ProposalPatchForm input) async {
    return patch<ProposalPatchForm>(
      path: '/$id',
      parseJsonFunction: ProposalPatchForm.fromJson,
      data: input.toJson(),
    );
  }

  Future<DataState<ProposalPatchForm>> sendOffer(int id) async {
    return patch<ProposalPatchForm>(
      path: '/$id',
      parseJsonFunction: ProposalPatchForm.fromJson,
      data: {'statusFlag': 2},
    );
  }

  Future<DataState<ProposalPatchForm>> acceptOffer(int id) async {
    return patch<ProposalPatchForm>(
      path: '/$id',
      parseJsonFunction: ProposalPatchForm.fromJson,
      data: {'statusFlag': 3},
    );
  }

    Future<DataState<ProposalWithStudent>> getProposalInfo(int id) async {
    return get<ProposalWithStudent>(
      path: '/$id',
      parseJsonFunction: ProposalWithStudent.fromJson,
    );
  }
}
