import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Student/Information/cubit/StudentInformation_cubit.dart';
import 'package:student_hub/UI/Student/Information/cubit/StudentInformation_state.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/core/models/input/student_profile_model.dart';
import 'package:student_hub/core/models/output/student_profile.dart';

@RoutePage()
class StudentInformationScreen
    extends BaseWidget<StudentInformationCubit, StudentInformationState> {
  final int id;
  const StudentInformationScreen({super.key, required this.id});

  @override
  Widget buildWidget(BuildContext context) {
    return StudentInformationWidget(id: id);
  }

  @override
  StudentInformationCubit? provideCubit(BuildContext context) {
    return StudentInformationCubit();
  }
}

class StudentInformationWidget extends StatefulWidget {
  final int id;
  const StudentInformationWidget({super.key, required this.id});

  @override
  State<StudentInformationWidget> createState() => _StudentInformationScreen();
}

class _StudentInformationScreen extends State<StudentInformationWidget> {
  @override
  Widget build(BuildContext context) {
    context.read<StudentInformationCubit>().setProposalId(widget.id);
    final state = context.watch<StudentInformationCubit>().state;
    String name = state.username ?? '';
    String techStack = state.techStack ?? '';
    List<SkillSet> skillset = state.skillSets;
    List<Education> education = state.educations;
    List<LanguageInput> languages = state.languages;
    List<Experience> experience = state.experiences;
    String resume = state.resume ?? '';
    String transcript = state.transcript ?? '';
    String resumeLink = state.resumeLink ?? '';
    String transcriptLink = state.transcriptLink ?? '';

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Detail",
          style: theme.textTheme.headlineMedium!.copyWith(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 70,
                  clipBehavior: Clip.none,
                  width: 70,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundImage:
                        AssetImage('lib/common/ui/assets/circle_avatar.png'),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSection('Tech Stack', techStack),
            _buildSection(
                'Skillset', skillset.map((e) => e.name).join(', ') ?? ''),
            _buildEduSection('Education', education),
            _buildLangSection('Languages', languages),
            _buildExpSection('Experience', experience),
            _buildDocumentSection('Resume', resume, resumeLink),
            _buildDocumentSection('Transcript', transcript, transcriptLink),
          ],
        ),
      ),
    );
  }

  Widget _buildLangSection(String title, List<LanguageInput> data) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyLarge!.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        if (data.isNotEmpty)
          Column(
            children: data.map((item) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.languageName ?? 'No Language Name',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Level: ${item.level ?? 'Unknown'}',
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }).toList(),
          )
        else
          Text(
            'No $title available',
          ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildExpSection(String title, List<Experience> experiences) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyLarge!.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        if (experiences.isNotEmpty)
          Column(
            children: experiences.map((experience) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.title ?? 'No Title',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    experience.description ?? 'No Description',
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Start: ${experience.startMonth ?? 'Unknown'}',
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'End: ${experience.endMonth ?? 'Unknown'}',
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }).toList(),
          )
        else
          const Text(
            'No experiences available',
          ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildEduSection(String title, List<Education> data) {
  final theme = Theme.of(context);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: theme.textTheme.bodyLarge!.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      if (data.isNotEmpty)
        Column(
          children: data.map((item) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.schoolName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'Start Year: ${item.startYear}',
                ),
                const SizedBox(height: 5),
                Text(
                  'End Year: ${item.endYear}',
                ),
                const SizedBox(height: 20),
              ],
            );
          }).toList(),
        )
      else
        Text(
          'No $title available',
        ),
      const SizedBox(height: 20),
    ],
  );
}

  Widget _buildSection(String title, String content) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyLarge!.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          content.isNotEmpty ? content : 'No data',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

 Widget _buildDocumentSection(String title, String fileName, String f) {
  final theme = Theme.of(context);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: theme.textTheme.bodyLarge!.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        width: MediaQuery.of(context).size.width * 0.7,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.fromLTRB(15, 8, 0, 8),
        decoration: BoxDecoration(
          color: const Color(0xffF6F7F9),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'lib/common/ui/assets/pdf.png',
                scale: 1.8,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fileName.isNotEmpty ? fileName : 'No file available',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<StudentInformationCubit>().downloadFile(f);
              },
              icon: const Icon(Icons.download),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}
}
