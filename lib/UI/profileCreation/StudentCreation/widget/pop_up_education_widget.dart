import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopUpEducationEditWidget extends StatefulWidget {
  final Function addEducation;
  final Function deleteEducation;
  final String schoolName;
  final int startYear;
  final int endYear;

  PopUpEducationEditWidget(this.addEducation, this.deleteEducation,
      this.schoolName, this.startYear, this.endYear);

  @override
  _PopUpEducationWidgetState createState() => _PopUpEducationWidgetState();
}

class _PopUpEducationWidgetState extends State<PopUpEducationEditWidget> {
  late TextEditingController _schoolNameController = TextEditingController();

  String schoolName = '';
  int _startYear = 0;
  int _endYear = 0;
  List<int> yearList = List<int>.generate(
      DateTime.now().year - (DateTime.now().year - 10) + 1,
      (i) => i + (DateTime.now().year - 10)).reversed.toList();
  List<int> yearListStart = [];
  List<int> yearListEnd = [];
  List<int> listYear = [];
  FixedExtentScrollController scrollController = FixedExtentScrollController();
  FixedExtentScrollController scrollControllerStart =
      FixedExtentScrollController();
  FixedExtentScrollController scrollControllerEnd =
      FixedExtentScrollController();
  bool showError = false;

  @override
  void initState() {
    super.initState();
    _schoolNameController = TextEditingController(text: widget.schoolName);
    _startYear = widget.startYear;
    _endYear = widget.endYear;

    int initialItemIndex = yearList.indexOf(DateTime.now().year);
    scrollController =
        FixedExtentScrollController(initialItem: initialItemIndex);
  }

  @override
  Widget build(BuildContext context) {
    // bool isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;
    bool isDarkMode = false;
    return AlertDialog(
      backgroundColor: isDarkMode ? Color(0xFF2f2f2f) : Colors.white,
      title: Text("educationpop1".tr(),
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
      content: SizedBox(
        height: 210.0,
        child: Column(
          children: [
            Row(
              children: [
                Text("educationpop2".tr(),
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                    )),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                    ),
                    cursorColor: Color(0xFF406AFF),
                    controller: _schoolNameController,
                    onChanged: (value) {
                      _schoolNameController.text = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "educationpop3".tr();
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("educationpop4".tr(),
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary
                    )),
                Text(_startYear == 0 ? "educationpop5".tr() : _startYear.toString(),
                    style: GoogleFonts.poppins(
                        color: isDarkMode
                            ? Color.fromARGB(255, 187, 187, 189)
                            : Color(0xFF777B8A),
                        fontSize: 14)),
                IconButton(
                  onPressed: () {
                    _endYear == 0
                        ? listYear = yearList
                        : listYear = List<int>.generate(
                                _endYear - (DateTime.now().year - 10) + 1,
                                (i) => i + (DateTime.now().year - 10))
                            .reversed
                            .toList();
                    int initialItemIndexStart =
                        listYear.indexOf(DateTime.now().year);
                    scrollControllerStart = FixedExtentScrollController(
                        initialItem: initialItemIndexStart);
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Center(
                              child: Container(
                            height: 200.0,
                            width: 250.0,
                            decoration: BoxDecoration(
                              color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,

                              borderRadius: BorderRadius.circular(
                                  20.0), // Điều chỉnh giá trị để thay đổi độ cong của góc
                            ),
                            child: CupertinoPicker(
                              scrollController: _endYear == 0
                                  ? scrollController
                                  : scrollControllerStart,
                              itemExtent: 40.0,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  _startYear = listYear[index];
                                });
                              },
                              children: listYear
                                  .map((year) => Center(
                                        child: Text(
                                          year.toString(),
                                          style: TextStyle(
                                           color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
 // Màu chữ
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ));
                        });
                  },
                  icon: Icon(Icons.calendar_today),
                  iconSize: 20.0,
                      color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("educationpop6".tr(),
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
)),
                Text(_endYear == 0 ? "educationpop5".tr() : _endYear.toString(),
                    style: GoogleFonts.poppins(
                      color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                        fontSize: 14)),
                IconButton(
                  onPressed: () {
                    _startYear == 0
                        ? listYear = yearList
                        : listYear = List<int>.generate(
                            DateTime.now().year - _startYear + 1 + 10,
                            (i) => i + _startYear + 1).reversed.toList();
                    int initialItemIndexEnd =
                        listYear.indexOf(DateTime.now().year);
                    scrollControllerEnd = FixedExtentScrollController(
                        initialItem: initialItemIndexEnd);
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Center(
                              child: Container(
                            height: 200.0,
                            width: 250.0,
                            decoration: BoxDecoration(
                      color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,

                              borderRadius: BorderRadius.circular(
                                  20.0), // Điều chỉnh giá trị để thay đổi độ cong của góc
                            ),
                            child: CupertinoPicker(
                              scrollController: _startYear == 0
                                  ? scrollController
                                  : scrollControllerEnd,
                              itemExtent: 40.0,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  _endYear = listYear[index];
                                });
                              },
                              children: listYear
                                  .map((year) => Center(
                                        child: Text(
                                          year.toString(),
                                          style: TextStyle(
                      color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
 // Màu chữ
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ));
                        });
                  },
                  icon: Icon(Icons.calendar_today),
                  iconSize: 20.0,
                      color: isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
            if (showError == true)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "educationpop7".tr(),
                  style: TextStyle(
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(244, 213, 222, 255),
          ),
          child: Text("educationpop8".tr(),
              style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500)),
          onPressed: () {
            Navigator.of(context).pop();
            _startYear = 0;
            _endYear = 0;
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xFF406AFF),
          ),
          child: Text("educationpop9".tr(),
              style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500)),
          onPressed: () {
            schoolName = _schoolNameController.text;
            print(schoolName);
            if (schoolName != " " && _startYear != 0 && _endYear != 0) {
              widget.deleteEducation(widget.schoolName);
              widget.addEducation(
                schoolName,
                _startYear,
                _endYear,
              );
              Navigator.of(context).pop();
            } else {
              //show text with red color at below end year
              setState(() {
                showError = true;
              });
            }
          },
        ),
      ],
    );
  }
}
