import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:student_hub/constant/project_profile.dart';
import 'package:student_hub/core/models/output/user.dart';
// import 'package:student_hub/models/model/company_profile.dart';
// import 'package:student_hub/models/model/education.dart';
// import 'package:student_hub/models/model/experience.dart';
// import 'package:student_hub/models/model/file_cv.dart';
import 'package:student_hub/models/model/language.dart';
// import 'package:student_hub/models/model/skillSets.dart';
// import 'package:student_hub/models/model/student_user.dart';
// import 'package:student_hub/models/model/techStack.dart';
// import 'package:student_hub/view_models/controller_route.dart';

// import '../components/loadingUI.dart';
// import '../models/model/users.dart';
// import '../services/connection_services.dart';
import 'dart:convert';

class InputProfileViewModel {
  final BuildContext context;
  InputProfileViewModel(this.context);

  Future<void> inputProfileCompany(User companyUser) async {
    print('Input Profile Company');
    var payload = companyUser.companyUser?.toMapCompanyUser();
    // Call a method to reload the page
    try {
      showDialog(context: context, builder: (context) => LoadingUI());
      var response =
          await ConnectionService().post('/api/profile/company', payload);
      if (response != null) {
        print("Connected to the server successfully");
        print("Connect server successful");
        print(response);
        // Call a method to reload the page
        var responseUser = jsonDecode(response);
        User userReponse = User.fromMapUserForCompany(responseUser);
        var responseUserAuth =
            await ConnectionService().get('/api/auth/me', {});
        var responseUserMap = jsonDecode(responseUserAuth);

        if (responseUserMap['result'] != null) {
          print('User Response');
          print(responseUserMap['result']);
          User userResponseAuth = User.fromMapUser(responseUserMap['result']);
          print(userResponseAuth.id);
          print(userResponseAuth.fullname);
          print(userResponseAuth.role);
          print(userResponseAuth.role?[0]);
          print(userResponseAuth.companyUser?.id);

          // Navigator.of(context).pop();
          // int role = int.parse(userResponse.role?[0]);
          int role = userResponseAuth.role?[0];
          print('length: ${userResponseAuth.role?.length}');
          Navigator.of(context).pop();
          ControllerRoute(context)
              .navigateToWelcomeView(userResponseAuth, companyUser.fullname!);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> inputProfileStudent(User studentUser) async {
    print('Input Profile Student');
    print(studentUser.studentUser?.techStack?.id);
    var payload = {
      "techStackId": studentUser.studentUser?.techStackId,
      "skillSets": studentUser.studentUser?.skillSet?.map((e) => e.id).toList(),
    };
    try {
      showDialog(context: context, builder: (context) => LoadingUI());
      var response =
          await ConnectionService().post('/api/profile/student', payload);
      var responseUserMap = jsonDecode(response);
      if (responseUserMap['result'] != null) {
        print("Connected to the server successfully");
        print("Connect server successful");
        print(response);
        // Call a method to reload the page
        if (studentUser.studentUser?.languages != null) {
          await putLanguage(responseUserMap['result']['id'],
              studentUser.studentUser!.languages!);
        }
        if (studentUser.studentUser?.education != null) {
          await putEducation(responseUserMap['result']['id'],
              studentUser.studentUser!.education!);
        }
        if (studentUser.studentUser?.experience != null) {
          await putExperience(responseUserMap['result']['id'],
              studentUser.studentUser!.experience!);
        }
        if (studentUser.studentUser?.file?.resume != null ||
            studentUser.studentUser?.file?.transcript != null) {
          await putFileCv(
              responseUserMap['result']['id'], studentUser.studentUser!.file!);
        }
        Navigator.of(context).pop();
        var responseUserAuth =
            await ConnectionService().get('/api/auth/me', {});
        var responseUser = jsonDecode(responseUserAuth);
        if (responseUser['result'] != null) {
          User userResponseAuth = User.fromMapUser(responseUser['result']);
          print(userResponseAuth.id);
          print(userResponseAuth.fullname);
          print(userResponseAuth.role);
          print(userResponseAuth.role?[0]);
          print(userResponseAuth.studentUser?.id);
          ControllerRoute(context)
              .navigateToHomeScreen(true, userResponseAuth, 1);
        }
      } else {
        print("Failed");
        Navigator.of(context).pop();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<TechStack>> getTechStack() async {
    print('Get Tech Stack');
    try {
      var response =
          await ConnectionService().get('/api/techstack/getAllTechStack', {});
      if (response != null) {
        print("Connected to the server successfully");
        print("Connect server successful");
        print(response);
        // Call a method to reload the page
        var responseList = jsonDecode(response);
        if (responseList['result'] != null) {
          List<TechStack> techStackList =
              TechStack.fromMapListTechStack(responseList['result']);

          return techStackList;
        }
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<SkillSets>> getSkillSets() async {
    print('Get Skill Sets');
    try {
      var response =
          await ConnectionService().get('/api/skillset/getAllSkillSet', {});
      if (response != null) {
        print("Connected to the server successfully");
        print("Connect server successful");
        print(response);
        // Call a method to reload the page
        var responseList = jsonDecode(response);
        if (responseList['result'] != null) {
          List<SkillSets> skillSetsList =
              SkillSets.fromMapListSkillSets(responseList['result']);

          return skillSetsList;
        }
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<void> putLanguage(int studentId, List<Language> languageList) async {
    print('Put Language');
    String url = '/api/language/updateByStudentId/$studentId';
    try {
      showDialog(context: context, builder: (context) => LoadingUI());

      var payload = {
        "languages": languageList
            .map((language) => {
                  "id": null,
                  "languageName": language.languageName,
                  "level": language.level,
                })
            .toList(),
      };
      var response = await ConnectionService().put(url, payload);
      var responseDecode = jsonDecode(response);
      if (responseDecode['result'] != null) {
        print("Connected to the server successfully");
        print("Connect server successful");
        print(response);
        // Call a method to reload the page
      } else {
        print("Failed");
        print(responseDecode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> putEducation(
      int studentId, List<Education> educationList) async {
    print('Put Education');
    String url = '/api/education/updateByStudentId/$studentId';
    //convert the list of education to a map
    try {
      showDialog(context: context, builder: (context) => LoadingUI());
      var payload = {
        "education": educationList
            .map((education) => {
                  "id": null,
                  "schoolName": education.schoolName,
                  "startYear": education.startYear,
                  "endYear": education.endYear,
                })
            .toList(),
      };
      var response = await ConnectionService().put(url, payload);
      var responseDecode = jsonDecode(response);
      if (responseDecode['result'] != null) {
        print("Connected to the server successfully");
        print("Connect server successful");
        print(response);
        // Call a method to reload the page
      } else {
        print("Failed");
        print(responseDecode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<Experience>> putExperience(
      int studrntId, List<Experience> experienceList) async {
    print('Put Experience');
    String url = '/api/experience/updateByStudentId/$studrntId';
    try {
      showDialog(context: context, builder: (context) => LoadingUI());
      var payload = {
        "experience": experienceList
            .map((experience) => {
                  "id": null,
                  "title": experience.title,
                  "startMonth": DateFormat('MM-yyyy')
                      .format(DateTime.parse(experience.startMonth.toString())),
                  "endMonth": DateFormat('MM-yyyy')
                      .format(DateTime.parse(experience.endMonth.toString())),
                  "description": experience.description,
                  "skillSets": experience.skillSet
                      ?.map((e) => e.id)
                      .toList(), //convert to list of id
                })
            .toList(),
      };

      var response = await ConnectionService().put(url, payload);
      var responseDecode = jsonDecode(response);
      if (responseDecode['result'] != null) {
        print("Connected to the server successfully");
        print("Connect server successful");
        print(response);
        // Call a method to reload the page
      } else {
        print("Failed");
        print(responseDecode);
      }
    } catch (e) {
      print(e);
    }

    return [];
  }

  Future<FileCV> putFileCv(int studentId, FileCV fileCV) async {
    print('Put File CV');
    String url = '/api/profile/student';
    try {
      showDialog(context: context, builder: (context) => LoadingUI());
      // var payload = fileCV.toMapFileCV();
      if (fileCV.resume != null) {
        String urlResume = '$url/$studentId/resume';
        print(urlResume);
        print(fileCV.resume);
        var response =
            await ConnectionService().putFile(urlResume, fileCV.resume!);
        print(response);
        var responseDecode = jsonDecode(response);
        if (responseDecode['result'] != null) {
          print("Connected to the server successfully");
          print("Resume: Connect server successful");
          print(response);
          // Call a method to reload the page
        } else {
          print("Failed upload file resume");
          print(responseDecode);
        }
      }
      if (fileCV.transcript != null) {
        String urlTranscript = '$url/$studentId/transcript';
        print(fileCV.transcript);
        var response = await ConnectionService()
            .putFile(urlTranscript, fileCV.transcript!);
        var responseDecode = jsonDecode(response);
        if (responseDecode['result'] != null) {
          print("Connected to the server successfully");
          print("Transcript: Connect server successful");
          print(response);
          // Call a method to reload the page
        } else {
          print("Failed upload file transcript");
          print(responseDecode);
        }
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
    return FileCV();
  }

  //  /api/profile/student/{studentId} get
  Future<StudentUser> getProfileStudent(int studentId) async {
    print('Get Profile Student');
    try {
      var response =
          await ConnectionService().get('/api/profile/student/$studentId', {});
      if (response != null) {
        print("Connected to the server successfully");
        print("Connect server successful");
        print(response);
        // Call a method to reload the page
        var responseDecode = jsonDecode(response);
        if (responseDecode['result'] != null) {
          StudentUser studentUser =
              StudentUser.fromMapStudentUser(responseDecode['result']);
          return studentUser;
        }
      }
    } catch (e) {
      print(e);
    }
    return StudentUser(
      id: 0,
      userId: 0,
      techStackId: 0,
      skillSet: [],
      languages: [],
      education: [],
      experience: [],
      file: FileCV(),
    );
  }

  Future<void> putProfileStudent(User user) async {
    print('Put Profile Student');
    try {
      showDialog(context: context, builder: (context) => LoadingUI());

      // Call a method to reload the page
      if (user.studentUser?.languages != null) {
        await putLanguage(user.studentUser!.id!, user.studentUser!.languages!);
      }
      if (user.studentUser?.education != null) {
        await putEducation(user.studentUser!.id!, user.studentUser!.education!);
      }
      if (user.studentUser?.experience != null) {
        await putExperience(
            user.studentUser!.id!, user.studentUser!.experience!);
      }
      if (user.studentUser?.file?.resume != null ||
          user.studentUser?.file?.transcript != null) {
        await putFileCv(user.studentUser!.id!, user.studentUser!.file!);
      }
//      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
  }

  //  /api/profile/company/{companyId} get
  Future<CompanyProfile> getProfileCompany(int companyId) async {
    print('Get Profile Company');
    try {
      var response =
          await ConnectionService().get('/api/profile/company/$companyId', {});
      if (response != null) {
        print("Connected to the server successfully");
        print("Connect server successful");
        print(response);
        // Call a method to reload the page
        var responseDecode = jsonDecode(response);
        if (responseDecode['result'] != null) {
          CompanyProfile companyProfile =
              CompanyProfile.fromJson(responseDecode['result']);
          return companyProfile;
        }
      }
    } catch (e) {
      print(e);
    }
    return CompanyProfile(
      id: 0,
      userId: 0,
      email: '',
      fullname: '',
      companyName: '',
      website: '',
      size: 0,
      description: '',
    );
  }

  // /api/profile/company/{id} put method
  Future<void> putProfileCompany(CompanyProfile companyUser) async {
    print('Put Profile Company');
    String url = '/api/profile/company/${companyUser.id}';
    try {
      showDialog(context: context, builder: (context) => LoadingUI());
      var payload = {
        "companyName": companyUser.companyName,
        "website": companyUser.website,
        "description": companyUser.description,
        "size": companyUser.size,
      };
      var response = await ConnectionService().put(url, payload);
      var responseDecode = jsonDecode(response);
      if (responseDecode['result'] != null) {
        print("Connected to the server successfully");
        print("Connect server successful");
        print(response);
        // Call a method to reload the page
        Navigator.of(context).pop();
        ;
      } else {
        print("Failed");
        print(responseDecode);
      }
    } catch (e) {
      print(e);
    }
  }
}
