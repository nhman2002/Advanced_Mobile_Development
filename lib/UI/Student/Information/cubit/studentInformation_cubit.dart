import 'dart:io';

import 'package:dio/dio.dart';
import 'package:student_hub/UI/Student/Information/cubit/StudentInformation_state.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:student_hub/core/repository/base.dart';
import 'package:student_hub/core/repository/general.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';
import 'package:student_hub/core/repository/proposal.dart';

class StudentInformationCubit extends WidgetCubit<StudentInformationState> {
  StudentInformationCubit()
      : super(
          initialState: const StudentInformationState(),
          parseJsonFunction: StudentInformationState.fromJson,
        );
  final _localStorage = getIt.get<LocalStorage>();
  final _proposal = getIt.get<ProposalRepository>();
  final _general = getIt.get<GeneralRepository>();
  late int studentId;
  int proposalId = 0;
  @override
  Future<void> init() async {
    // TODO: implement init
  }

  //ask for storage permission
  

  Future<void> _handleInit() async {
    final result = await _proposal.getProposalInfo(state.proposalId ?? -1);

    if (result is DataSuccess) {
      //       final TechStack? techStack;
      // final List<SkillSet> skillSets;
      // final List<Education> educations;
      // final List<Experience> experiences;
      // final String? resume;
      // final String? transcript;
      studentId = result.data?.student.id ?? 0;

      final techStack = result.data?.student.techStackName;
      final skillSets = result.data?.student.skillSets;
      final educations = result.data?.student.educations;
      final experiences = result.data?.student.experiences;
      final resume = result.data?.student.resume;
      final transcript = result.data?.student.transcript;
      final resumeLink = result.data?.resumeLink;
      final transcriptLink = result.data?.transcriptLink;

      final result2 = await _general.getLanguage(studentId);
      if (result2 is DataSuccess) {
        emit(state.copyWith(
          techStack: techStack,
          skillSets: skillSets,
          educations: educations,
          experiences: experiences,
          resume: resume,
          transcript: transcript,
          username: result.data?.student.fullname,
          languages: result2.data ?? [],
          resumeLink: resumeLink,
          transcriptLink: transcriptLink,
        ));
      }
    }
  }

  Future<void> setProposalId(int proposalId) async {
    if (state.proposalId == null) {
      emit(state.copyWith(proposalId: proposalId));
      await _handleInit();
    }
  }

  Future<void> downloadFile(String url) async {
    await download(url);
    }
  

  Future download(String url) async {

    //set path to download
    final Dio dio = Dio();
    //get file name
    
    // 1715260407352-20126064.pdf?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=studenthub-storage%40fast-lattice-416510.iam.gserviceaccount.com%2F20240515%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240515T213344Z&X-Goog-Expires=604800&X-Goog-SignedHeaders=host&X-Goog-Signature=0b8423f74665b10c7474f9b53769ff9945caf2384f63d9dbdbc57ba09976f92e526369b7fccd6440d135c47e1ae7e3ca4e1d4f7a545604de4a1327cf2658ee58339861bf730478f14237cad56efef770d4f718e30dad5ca412cef04a86d9a43d2d8f64b30857caccd8a7ac1e565a4df7fe95ed870e3d7c705166caa2f4028f55c6abb75bf649c2c766fcd769a4271061ab96680deb6cefdb78678cc76506fb174cbd5bbe5ee0cfd049143f9eeae52c2828f5d088a1db396d12cd7c6eda9976401821767f9e6649340ae63313ad579ef39836c6692d24fd4fb0de0552435680d6b4c64189d7cea785f9f4648c68696b74524f328a2c8e5f822e8fd51690865b9c
    //save path
    var fileName = url.split('?')[0].split('-').last;
    var savePath = '/storage/emulated/0/Download/$fileName';
    try {
      Response response = await dio.get(
        url,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

}