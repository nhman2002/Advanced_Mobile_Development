import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/widget/pop_up_education_widget.dart';
import 'package:student_hub/core/models/input/student_profile_model.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
// import 'package:student_hub/widgets/pop_up_education_widget.dart';
// import 'package:student_hub/models/model/education.dart';
// import 'package:student_hub/widgets/theme/dark_mode.dart';

class ShowSchoolWidget extends StatelessWidget {
  final List<EducationInput> educationList;
  final Function _deleteSchool;
  final Function _addNewEducation;
  final bool? isEditing;

  const ShowSchoolWidget({
    super.key,
    required this.educationList,
    required Function deleteSchool,
    required Function addNewEducation,
    required this.isEditing,
  })  : _deleteSchool = deleteSchool,
        _addNewEducation = addNewEducation;

  @override
  Widget build(BuildContext context) {
    // bool isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;
    bool isDarkMode = false;
    return ListView.builder(
      itemCount: educationList.length,
      itemBuilder: (ctx, index) {
        return Column(
          children: [
            ListTile(
              title: Text(educationList[index].schoolName!,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  )),
              subtitle: Text(
                  ' ${educationList[index].startYear!} - ${educationList[index].endYear!}',
                  style: GoogleFonts.poppins(fontSize: 13, color: isDarkMode ? const Color.fromARGB(255, 188, 188, 188) : Color.fromARGB(255, 73, 73, 73))),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Visibility(
                    visible: isEditing!, // Hiển thị khi isEditing là true
                    child: IconButton(
                      icon: Image.asset(
                        'lib/common/ui/assets/edit.jpg', // Đường dẫn đến hình ảnh edit.jpg
                        width: 21, // Kích thước của hình ảnh
                        height: 21,
                      ),
                      onPressed: () {
                        // Handle edit button press
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PopUpEducationEditWidget(
                              _addNewEducation,
                              _deleteSchool,
                              educationList[index].schoolName!,
                              educationList[index].startYear! as int,
                              educationList[index].endYear! as int,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Visibility(
                    visible: isEditing!, // Hiển thị khi isEditing là true
                    child: IconButton(
                      icon: Image.asset(
                        'lib/common/ui/assets/delete.jpg', // Đường dẫn đến hình ảnh edit.jpg
                        width: 21, // Kích thước của hình ảnh
                        height: 21,
                      ),
                      onPressed: () {
                        _deleteSchool(educationList[index].schoolName!);
                        // Handle delete button press
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 190, 190, 192),
              thickness: 0.8,
            ),
          ],
        );
      },
    );
  }
}
