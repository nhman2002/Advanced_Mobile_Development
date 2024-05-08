import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/cubit/studentProfileInput_cubit.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/cubit/studentProfileInput_state.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:easy_localization/easy_localization.dart';


@RoutePage()
class StudentProfileInputTechStack extends StatefulWidget {
  const StudentProfileInputTechStack({Key? key}) : super(key: key);

  @override
  State<StudentProfileInputTechStack> createState() => _StudentProfileInputTechStackState();
}

class _StudentProfileInputTechStackState extends State<StudentProfileInputTechStack> {
  String? selectedTechStackID;
  List<String> selectedSkills = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentProfileInputCubit, StudentProfileInputState>(
      builder: (context, state) {
        final techStackList = state.techStackList;
        final skillSetList = state.skillSetList;

        return Scaffold(
          appBar: AppBar(
            title: Text(''),
            leading: IconButton(
              icon: Icon(Icons.home),
              color: Colors.black,
              onPressed: () {
                context.router.push(const SwitchAccountPageRoute());
              },
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(12),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("companyprofileinput_ProfileCreation1".tr(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text("studentprofileinput1_ProfileCreation1".tr(), style: TextStyle(fontSize: 14)),
                  SizedBox(height: 20),
                  Text("studentprofileinput1_ProfileCreation2".tr(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  DropdownButton<String>(
                    isExpanded: true,
                    hint: Text("studentprofileinput1_ProfileCreation3".tr()),
                    value: selectedTechStackID,
                    onChanged: (value) {
                      setState(() {
                        selectedTechStackID = value;
                      });
                      // Save selected tech stack ID to the state
                    },
                    items: techStackList.map((tech) {
                      return DropdownMenuItem<String>(
                        value: tech!.id.toString(),
                        child: Text(tech.name),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  MultiSelectChipField(
                    items: skillSetList.map((skill) => MultiSelectItem<String>(skill!.id.toString(), skill!.name)).toList(),
                    initialValue: [],
                    onTap: (values) {
            
                      selectedSkills = values.toList().cast<String>();
                      debugPrint(selectedSkills.toString());
                    },
                    chipColor: Colors.white,
                    selectedChipColor: Colors.purple,
                    textStyle: TextStyle(color: Colors.black),
                    selectedTextStyle: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      next(context);
                    },
                    child: Text("studentprofileinput1_ProfileCreation4".tr()),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  Future<void> next(BuildContext context) async {
    context.read<StudentProfileInputCubit>().setSelectedSkillSet(selectedSkills);
    context.read<StudentProfileInputCubit>().setSelectedTechStackID(selectedTechStackID);
    context.router.push(const StudentProfileInputCVRoute());
    }
}
