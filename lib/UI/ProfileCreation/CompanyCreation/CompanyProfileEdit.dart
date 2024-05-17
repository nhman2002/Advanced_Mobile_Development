import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/company_model.dart';
import 'package:student_hub/core/repository/profileCompany.dart';

@RoutePage()
class CompanyProfileEdit extends StatefulWidget {
  const CompanyProfileEdit({super.key});

  @override
  _CompanyProfileEditState createState() => _CompanyProfileEditState();
}

class _CompanyProfileEditState extends State<CompanyProfileEdit>
    with SnackBarDefault {
  int? _selectedValue;
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _companyProfileRepository = getIt.get<CompanyProfileRepository>();
  final _localStorage = getIt.get<LocalStorage>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const SwitchAccountPageRoute());
            },
            icon: const Icon(
              Icons.account_circle,
              size: 40.0,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Editting your company profile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Please fill in the following information to edit your company profile",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              _buildInputField("companyprofileinput_ProfileCreation9".tr(),
                  _companyNameController),
              const SizedBox(height: 10),
              _buildInputField("companyprofileinput_ProfileCreation10".tr(),
                  _websiteController),
              const SizedBox(height: 10),
              _buildInputField("companyprofileinput_ProfileCreation11".tr(),
                  _descriptionController),
              const SizedBox(height: 20),
              Column(
                children: [
                  _buildRadioOption(
                      1, "companyprofileinput_ProfileCreation4".tr()),
                  _buildRadioOption(
                      2, "companyprofileinput_ProfileCreation5".tr()),
                  _buildRadioOption(
                      3, "companyprofileinput_ProfileCreation6".tr()),
                  _buildRadioOption(
                      4, "companyprofileinput_ProfileCreation7".tr()),
                  _buildRadioOption(
                      5, "companyprofileinput_ProfileCreation8".tr()),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        handleEdit(context);
                      },
                      child: Text("companyprofileedit_ProfileCreation1".tr()),
                    ),
                    const SizedBox(width: 10), // Add spacing between buttons
                    ElevatedButton(
                      onPressed: () {
                        context.router.maybePop();
                      },
                      child: Text("companyprofileedit_ProfileCreation2".tr()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioOption(int value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: _selectedValue,
          onChanged: (newValue) {
            setState(() {
              _selectedValue = newValue;
            });
          },
        ),
        Text(label),
      ],
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
        ),
      ),
    );
  }

  Future<void> handleEdit(BuildContext context) async {
    final form = InputCompanyProfile().copyWith(
      companyName: _companyNameController.text,
      website: _websiteController.text,
      description: _descriptionController.text,
      size: _selectedValue,
    );
    final companyID = _localStorage.getString(key: StorageKey.companyID);
    final companyIDInt = int.tryParse(companyID ?? '');

    final result = await _companyProfileRepository.editCompanyProlfile(
        form, companyIDInt ?? -1);
    if (result is DataSuccess) {
      showSnackBarSuccess(context, 'Company profile edited successfully');
      context.router.push(const CompanyDashboardWrapperRoute());
    } else {
      showSnackBarError(context, 'Failed to edit company profile');
      context.router.maybePop();
    }
  }
}
