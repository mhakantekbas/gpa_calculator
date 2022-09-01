import 'package:flutter/material.dart';
import 'package:gpa_calculator/constants/app_constants.dart';
import 'package:gpa_calculator/widgets/gpa_calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinamic Grade Point Average Calculator ',
      theme: ThemeData(
          primarySwatch: Constants.primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: GpaCalculatorPage(),
    );
  }
}
