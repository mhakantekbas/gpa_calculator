import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class CreditDropdown extends StatefulWidget {
  final Function onCreditSelected;
  const CreditDropdown({Key? key, required this.onCreditSelected})
      : super(key: key);

  @override
  State<CreditDropdown> createState() => _CreditDropdownState();
}

class _CreditDropdownState extends State<CreditDropdown> {
  double selectedValueOfCredit = 4.0;
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
        items: DataHelper.allCredits(),
        value: selectedValueOfCredit,
        onChanged: (selected) {
          setState(() {
            selectedValueOfCredit = selected!;
            widget.onCreditSelected(selectedValueOfCredit);
          });
        },
        underline: Container(),
      ),
    );
  }
}
