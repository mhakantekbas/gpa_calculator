import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class LetterDropDownButton extends StatefulWidget {
  final Function onLetterSelected;
  const LetterDropDownButton({Key? key, required this.onLetterSelected})
      : super(key: key);

  @override
  State<LetterDropDownButton> createState() => _LetterDropDownButtonState();
}

class _LetterDropDownButtonState extends State<LetterDropDownButton> {
  double selectedValueOfLetter = 4.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
          color: Constants.primaryColor.shade100.withOpacity(0.3),
          borderRadius: Constants.borderRadius),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Constants.primaryColor.shade200,
        items: DataHelper.lettersOfCourses(),
        value: selectedValueOfLetter,
        onChanged: (selected) {
          setState(() {
            selectedValueOfLetter = selected!;
            widget.onLetterSelected(
                selectedValueOfLetter); // onletterSelected state dışında olduğu için widget. diyerek çağırdık
          });
        },
        underline: Container(),
      ),
    );
  }
}
