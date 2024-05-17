import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_cubit.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_state.dart';
import 'package:student_hub/UI/company/widget/ProposalSectionButton.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/core/models/output/message_output.dart';

@RoutePage()
class CompanyProjectMessage extends StatefulWidget {
  const CompanyProjectMessage({super.key});

  @override
  State<CompanyProjectMessage> createState() => _CompanyProjectMessage();
}

class _CompanyProjectMessage extends State<CompanyProjectMessage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyDashboardCubit, CompanyDashboardState>(
      builder: (context, state) {
        // Retrieve project detail from state if needed
        final projectDetail = state.clickedProject;
        final messages = state.messagesOfProject;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Student Hub'),
            actions: [
              IconButton(
                onPressed: () {
                  // Add onPressed logic here
                },
                icon: const Icon(
                  Icons.account_circle,
                  size: 40.0,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  projectDetail!.title!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildProposalSectionButton(
                        Theme.of(context),
                        "companyprojecthired_company1".tr(),
                        Colors.black,
                        false, () {
                      context.router
                          .replace(const CompanyProjectProposalsRoute());
                    }),
                    buildProposalSectionButton(
                        Theme.of(context),
                        "companyprojecthired_company2".tr(),
                        Colors.black,
                        false, () {
                      context.router.replace(const CompanyProjectDetailRoute());
                    }),
                    buildProposalSectionButton(
                        Theme.of(context),
                        "companyprojecthired_company3".tr(),
                        Colors.white,
                        true,
                        () {}),
                    buildProposalSectionButton(
                        Theme.of(context),
                        "companyprojecthired_company4".tr(),
                        Colors.black,
                        false, () {
                      context.router.replace(const CompanyProjectHiredRoute());
                    }),
                  ],
                ),
                const SizedBox(height: 20),
                _buildMessageContent(
                    messages, state.userId!, state.clickedProjectID),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMessageContent(
      List<MessageOutput>? messages, int userId, int projectId) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              itemCount: messages!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('Tile clicked');
                    context.router.push(MessageDetailScreenRoute(
                      userId: userId,
                      receiverId: messages[index].receiverId! == userId
                          ? messages[index].senderId!
                          : messages[index].receiverId!,
                      projectId: projectId,
                      receiverName: messages[index].receiverId == userId
                          ? messages[index].senderName!
                          : messages[index].receiverName!,
                    ));
                  },
                  child: ListTile(
                    leading: const Icon(Icons
                        .supervised_user_circle), // Replace with actual icons
                    title: Text(messages[index].receiverId == userId
                        ? messages[index].senderName ?? ''
                        : messages[index].receiverName ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(messages[index].content ?? ''),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
