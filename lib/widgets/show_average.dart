import 'package:flutter/material.dart';
import 'package:gpa_calculator/constants/app_constants.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int numberOfCourse;
  const ShowAverage(
      {Key? key, required this.average, required this.numberOfCourse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numberOfCourse > 0 ? "$numberOfCourse Courses Added" : "Add a Course",
          style: Constants.bodyStyle,
        ),
        Text(
          average >= 0
              ? "${average.toStringAsFixed(2)}"
              : "0.0", //virgülden sonra 2 basamak gösterir
          style: Constants.averageStyle,
        ),
        Text(
          "Average",
          style: Constants.bodyStyle,
        ),
      ],
    );
  }
}
