import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/UI/Student/ProjectList/cubit/ProjectList_cubit.dart';
import 'package:student_hub/UI/Student/ProjectList/cubit/ProjectList_state.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';


@RoutePage()
class CoverLetterPage extends StatefulWidget {
  const CoverLetterPage({Key? key}) : super(key: key);

  @override
  _CoverLetterPageState createState() => _CoverLetterPageState ();
}

class _CoverLetterPageState extends State<CoverLetterPage> with SnackBarDefault{

  final coverLetter = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectListCubit, ProjectListState>(
      builder: (context, state) {
        final project = state.clickedProject;
        // Assuming you have access to project details from the state
        return Scaffold(
          appBar: AppBar(
            title: Text("projectlistcover_student1".tr()),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "projectlistcover_student2".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: coverLetter,
                    focusNode: _focusNode,
                    maxLines: 5, // Set max lines to 5
                    onChanged: (value) {
                      // Handle text field changes if needed
                    },
                    decoration: InputDecoration(
                      hintText: "projectlistcover_student7".tr(),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              context.router.maybePop();
                            },
                            child: Text("projectlistcover_student3".tr()),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              postProposal(context, coverLetter.text, project!.projectId ?? 0);
                            },
                            child: Text("projectlistcover_student4".tr()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> postProposal(BuildContext context, String coverLetter, int projectID) async {
    if (coverLetter.isEmpty) {
      showSnackBarWarning(context, "projectlistcover_student5".tr());
      return;
    }

    await context.read<ProjectListCubit>().postProposal(projectID, coverLetter);
    context.router.maybePop();
    context.router.replace(const StudentDashBoardWrapperRoute());
    showSnackBarSuccess(context, "projectlistcover_student6".tr());
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _scrollToBottom();
      }
    });
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 300), () {
      if (_focusNode.hasFocus) {
        final scrollController = Scrollable.of(context)?.position;
        scrollController?.ensureVisible(
          _focusNode.context!.findRenderObject()!,
          alignment: 1.0,
          duration: Duration(milliseconds: 300),
        );
      }
    });
  }
}