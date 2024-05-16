import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/company_model.dart';
import 'package:student_hub/core/repository/base.dart';
import 'package:student_hub/core/repository/profileCompany.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';

@RoutePage()
class CompanyProfileInput extends StatefulWidget {
  @override
  _CompanyProfileInputState createState() => _CompanyProfileInputState();
}

class _CompanyProfileInputState extends State<CompanyProfileInput> with SnackBarDefault {
  int? _selectedValue;
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  final _companyProfileRepository = getIt.get<CompanyProfileRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Allow keyboard to push up the screen
      appBar: AppBar(
        title: Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const SwitchAccountPageRoute());
            },
            icon: Icon(
              Icons.account_circle,
              size: 40.0,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "companyprofileinput_ProfileCreation1".tr(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "companyprofileinput_ProfileCreation2".tr(),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "companyprofileinput_ProfileCreation3".tr(),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  _buildRadioOption(0, "companyprofileinput_ProfileCreation4".tr()),
                  _buildRadioOption(1, "companyprofileinput_ProfileCreation5".tr()),
                  _buildRadioOption(2, "companyprofileinput_ProfileCreation6".tr()),
                  _buildRadioOption(3, "companyprofileinput_ProfileCreation7".tr()),
                  _buildRadioOption(4, "companyprofileinput_ProfileCreation8".tr()),
                ],
              ),
              SizedBox(height: 20),
              _buildInputField("companyprofileinput_ProfileCreation9".tr(), _companyNameController),
              SizedBox(height: 10),
              _buildInputField("companyprofileinput_ProfileCreation10".tr(), _websiteController),
              SizedBox(height: 10),
              _buildInputField("companyprofileinput_ProfileCreation11".tr(), _descriptionController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  handleInput(context);
                },
                child: Text("companyprofileinput_ProfileCreation12".tr()),
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
              _selectedValue = newValue as int?;
            });
          },
        ),
        Text(label),
      ],
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

  Future<void> handleInput(BuildContext context) async {
    final form = InputCompanyProfile().copyWith(
      companyName: _companyNameController.text,
      website: _websiteController.text,
      description: _descriptionController.text,
      size: _selectedValue,
    );
    final _localStorage = getIt.get<LocalStorage>();

    final result = await _companyProfileRepository.inputCompanyProfile(form);
    if (result is DataSuccess) {
      _localStorage.saveString(key: StorageKey.companyID, value: result.data!.id.toString());
      showSnackBarSuccess(context, 'Company profile created successfully');
      context.router.push(const CompanyDashboardWrapperRoute());
    } else {
      showSnackBarError(context, 'Failed to create company profile');
      context.router.maybePop();
    }
  }
}
