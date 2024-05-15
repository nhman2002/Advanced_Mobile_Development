import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            title: Text('Student Hub'),
            actions: [
              IconButton(
                onPressed: () {
                  // Add onPressed logic here
                },
                icon: Icon(
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
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildProposalSectionButton(
                        Theme.of(context), 'Proposals', Colors.black, false,
                        () {
                      context.router
                          .replace(const CompanyProjectProposalsRoute());
                    }),
                    buildProposalSectionButton(
                        Theme.of(context), 'Detail', Colors.black, false, () {
                      context.router.replace(const CompanyProjectDetailRoute());
                    }),
                    buildProposalSectionButton(Theme.of(context), 'Message',
                        Colors.white, true, () {}),
                    buildProposalSectionButton(
                        Theme.of(context), 'Hired', Colors.black, false, () {
                      context.router.replace(const CompanyProjectHiredRoute());
                    }),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 600,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildMessageContent(
                            messages, state.userId!, state.clickedProjectID),
                      ],
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

  Widget _buildMessageContent(
      List<MessageOutput>? messages, int userId, int projectId) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: messages!.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print('Tile clicked');
                  context.router.push(MessageDetailScreenRoute(
                    userId: userId,
                    receiverId: messages![index].receiverId! == userId
                        ? messages![index].senderId!
                        : messages![index].receiverId!,
                    projectId: projectId,
                    receiverName: messages![index].receiverId == userId
                        ? messages![index].senderName!
                        : messages![index].receiverName!,
                  ));
                },
                child: ListTile(
                  leading: Icon(Icons
                      .supervised_user_circle), // Replace with actual icons
                  title: Text(messages![index].receiverId == userId
                      ? messages![index].senderName ?? ''
                      : messages![index].receiverName ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(messages![index].content ?? ''),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
