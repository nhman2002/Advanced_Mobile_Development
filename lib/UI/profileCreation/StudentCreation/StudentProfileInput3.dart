import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/cubit/studentProfileInput_cubit.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/cubit/studentProfileInput_state.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';


@RoutePage()
class StudentProfileInputCV extends StatefulWidget {
  const StudentProfileInputCV({Key? key}) : super(key: key);

  @override
  _StudentProfileInputCVState createState() => _StudentProfileInputCVState();
}


class _StudentProfileInputCVState extends State<StudentProfileInputCV> with SnackBarDefault{
  String cvPath = '';
  String cvFileName = '';
  String transcriptPath = '';
  String transcriptFileName = '';
  File cvFile = File('');
  File transcriptFile = File('');
  

  Future<void> _pickFile(String fileType) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null) {
        setState(() {
          if (fileType == 'CV') {
            cvPath = result.files.single.path!;
            cvFileName = result.files.single.name!;
          } else if (fileType == 'Transcript') {
            transcriptPath = result.files.single.path!;
            transcriptFileName = result.files.single.name!;
          }
        });
      } else {
        // User canceled the file picker dialog
        print('User canceled file picking');
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentProfileInputCubit, StudentProfileInputState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("studentprofileinput3_ProfileCreation1".tr()),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    "studentprofileinput3_ProfileCreation2".tr(),
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "studentprofileinput1_ProfileCreation1".tr(),
                ),
                SizedBox(height: 16.0),
                Text("studentprofileinput3_ProfileCreation3".tr()),
                _buildFilePickerContainer('CV', cvPath, cvFileName),
                SizedBox(height: 16.0),
                Text("studentprofileinput3_ProfileCreation4".tr()),
                _buildFilePickerContainer(
                    "studentprofileinput3_ProfileCreation4".tr(), transcriptPath, transcriptFileName),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    next(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  child: Text(
                    "studentprofileinput3_ProfileCreation5".tr(),
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilePickerContainer(
      String fileType, String filePath, String fileName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 100.0,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _pickFile(fileType),
                  child: Text(filePath.isEmpty
                      ? "studentprofileinput3_ProfileCreation6".tr()
                      : "studentprofileinput3_ProfileCreation7".tr()),
                ),
                SizedBox(height: 8.0),
                if (filePath.isNotEmpty) Text(fileName), // Display filename
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> next(BuildContext context) async {
    if (cvPath.isEmpty) {
      showSnackBarWarning(context, "studentprofileinput3_ProfileCreation8".tr());
      return;
    }
    context.read<StudentProfileInputCubit>().setCV(cvPath);

    if (transcriptPath.isNotEmpty) {
      context.read<StudentProfileInputCubit>().setTranscript(transcriptPath);
    }
    await context.read<StudentProfileInputCubit>().uploadProfile(context);
    
      showSnackBarSuccess(context, context.read<StudentProfileInputCubit>().state.message!);
      //context.router.popUntilRoot();
      final isSuccess = context.read<StudentProfileInputCubit>().state.isSuccess;
        context.router.replace(const SwitchAccountPageRoute());
  }
}