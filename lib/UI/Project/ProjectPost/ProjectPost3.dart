import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Project/ProjectPost/cubit/ProjectPost_cubit.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:easy_localization/easy_localization.dart';


@RoutePage()
class ProjectPosting3 extends StatefulWidget  {
  const ProjectPosting3({super.key});

  @override
  State<ProjectPosting3> createState() => _ProjectPosting3State();
}

class _ProjectPosting3State extends State<ProjectPosting3> {
  int step = 3;
  String errorMessage = '';
  final projectDescribe = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("projectpost3_project1".tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "projectpost3_project2".tr(),
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
               "projectpost3_project3".tr(),
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '\u2022 ',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "projectpost3_project4".tr(),
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '\u2022 ',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "projectpost3_project5".tr(),
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '\u2022 ',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "projectpost3_project6".tr(),
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              "projectpost3_project7".tr(),
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: projectDescribe,
              maxLines: 7,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  hintText: "projectpost3_project8".tr()),
              onChanged: (value) {
                setState(() {
                  errorMessage = '';
                });
              },
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: errorMessage.isNotEmpty
                  ? Text(
                      errorMessage,
                      style: const TextStyle(fontSize: 16),
                    )
                  : const SizedBox(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    next(context, projectDescribe.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF008ABD),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text("projectpost3_project9".tr()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void next(BuildContext context, String projectDescribe) {
    context.read<ProjectPostCubit>().updateDescription(projectDescribe);
    context.router.push(const ProjectPosting4Route());
  }
}

