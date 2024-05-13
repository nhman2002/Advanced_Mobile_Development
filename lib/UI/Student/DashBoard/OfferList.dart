import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Student/DashBoard/cubit/StudentDashBoard_state.dart';
import 'package:student_hub/UI/Student/DashBoard/cubit/StudentDashboard_cubit.dart';

@RoutePage()
class OfferListPage extends StatefulWidget {
  const OfferListPage({super.key});

  @override
  State<OfferListPage> createState() => _OfferListPage();
}

class _OfferListPage extends State<OfferListPage> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentDashBoardCubit, StudentDashBoardState>(
      builder: (context, state) {
        final offers = state.offerList;
        return Scaffold(
          appBar: AppBar(
            title: Text('Offer List'),
          ),
          body: ListView.builder(
            itemCount: offers.length,
            itemBuilder: (context, index) {
              final offer = offers[index];
              return OfferItem(
                projectName: offer.project.title ?? '',
                companyName: '',
              );
            },
          ),
        );
      },
    );
  }
}

class OfferItem extends StatelessWidget {
  final String projectName;
  final String companyName;

  const OfferItem({
    required this.projectName,
    required this.companyName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project: $projectName',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Company: $companyName',
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle accept button press
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: Text('Accept'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle reject button press
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Text('Reject'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
