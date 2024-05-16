import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Student/DashBoard/cubit/StudentDashBoard_state.dart';
import 'package:student_hub/UI/Student/DashBoard/cubit/StudentDashboard_cubit.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';


@RoutePage()
class OfferListPage extends StatefulWidget {
  const OfferListPage({Key? key}) : super(key: key);

  @override
  State<OfferListPage> createState() => _OfferListPage();
}

class _OfferListPage extends State<OfferListPage> with SnackBarDefault {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentDashBoardCubit, StudentDashBoardState>(
      builder: (context, state) {
        final offers = state.offerList;
        return Scaffold(
          appBar: AppBar(
            title: Text("offerlist1".tr()),
          ),
          body: ListView.builder(
            itemCount: offers.length,
            itemBuilder: (context, index) {
              final offer = offers[index];
              return offerItem(
                projectName: offer.project.title ?? '',
                id: offer.id,
                func: () {acceptOffer(offer.id);},
              );
            },
          ),
        );
      },
    );
  }

  Widget offerItem({
    required String projectName,
    required int id,
    required VoidCallback func,
  }) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "offerlist2".tr() + '$projectName',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "offerlist3".tr(),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    func();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: Text("offerlist4".tr()),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle reject button press
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Text("offerlist5".tr()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> acceptOffer(int id) async {
    // Call the API to accept the offer
    await context.read<StudentDashBoardCubit>().acceptOffer(id);
    showSnackBarSuccess(
        context, context.read<StudentDashBoardCubit>().state.message ?? '');
  }
}
