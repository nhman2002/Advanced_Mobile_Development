import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ProjectFilter extends StatefulWidget {
  @override
  _ProjectFilter createState() => _ProjectFilter();
}

class _ProjectFilter extends State<ProjectFilter> {
  int? _selectedValue; // For storing the selected radio button value
  TextEditingController _studentNeededController = TextEditingController(); // For storing input of "Student needed"
  TextEditingController _proposalsLessController = TextEditingController(); // For storing input of "Proposals less than"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
              // Implement route logic here
            },
            icon: Icon(Icons.account_circle, color: Colors.white, size: 40.0),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row section directly below the AppBar
            Row(
              children: [
                Expanded(
                  child: SearchAnchor(
                    builder: (BuildContext context, SearchController controller) {
                      return SearchBar(
                        controller: controller,
                        padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0)
                        ),
                        onTap: () {
                          // controller.openView();
                        },
                        onChanged: (_) {
                          controller.openView();
                        },
                        leading: const Icon(Icons.search),
                        trailing: <Widget>[
                          const Tooltip(
                            message: 'Change brightness mode',
                          ),
                        ],
                      );
                    },
                    suggestionsBuilder: (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              controller.closeView(item);
                            });
                          },
                        );
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, context.router.push(const LoginPageRoute()) as String);
                  },
                  icon: const Icon(Icons.filter_alt_rounded),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Custom FilterSection widget
            FilterSection(
              selectedValue: _selectedValue,
              onValueChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
              studentNeededController: _studentNeededController, // Pass the controller to FilterSection
              proposalsLessController: _proposalsLessController, // Pass the controller to FilterSection
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of controllers when the widget is disposed
    _studentNeededController.dispose();
    _proposalsLessController.dispose();
    super.dispose();
  }
}

class FilterSection extends StatelessWidget {
  final int? selectedValue;
  final Function(int?) onValueChanged;
  final TextEditingController studentNeededController; // Receive controller for "Student needed"
  final TextEditingController proposalsLessController; // Receive controller for "Proposals less than"

  FilterSection({
    required this.selectedValue,
    required this.onValueChanged,
    required this.studentNeededController,
    required this.proposalsLessController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  // Action to close the filter section
                },
              ),
              const SizedBox(height: 5),
              const Text(
                'Filter by',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Project length',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Column(
            children: [
              _buildRadioOption(1, "Less than one month"),
              _buildRadioOption(2, "1-3 months"),
              _buildRadioOption(3, "3-6 months"),
              _buildRadioOption(5, "More than 6 months"),
            ],
          ),
          const SizedBox(height: 20),
          _buildInputField('Student needed', studentNeededController),
          const SizedBox(height: 20),
          _buildInputField('Proposals less than', proposalsLessController),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Clear filters action
                  // Clear controllers if needed
                  studentNeededController.clear();
                  proposalsLessController.clear();
                  onValueChanged(null);
                },
                child: const Text('Clear filters'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Apply filters action
                  // Use the controllers and the selected value for filtering
                  int? selected = selectedValue;
                  String studentNeeded = studentNeededController.text;
                  String proposalsLess = proposalsLessController.text;
                  print('Apply filters with selected value: $selected');
                  print('Student needed: $studentNeeded');
                  print('Proposals less than: $proposalsLess');
                },
                child: const Text('Apply'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(int value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: selectedValue,
          onChanged: onValueChanged,
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
        border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        controller: controller, // Use the provided controller
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
        ),
      ),
    );
  }
}
