import 'package:flutter/material.dart';

import '../model/course.dart';

class DataHelper {
  static List<String> _lettersOfCourses() {
    return [
      "A",
      "A-",
      "B+",
      "B",
      "B-",
      "C+",
      "C",
      "C-",
      "D+",
      "D",
      "F",
    ];
  }

  static double? _letterConverter(String letter) {
    switch (letter) {
      case "A":
        return 4;
      case "A-":
        return 3.67;
      case "B+":
        return 3.33;
      case "B":
        return 3;
      case "B-":
        return 2.67;
      case "C+":
        return 2.33;
      case "C":
        return 2;
      case "C-":
        return 1.67;
      case "D+":
        return 1.33;
      case "D":
        return 1;
      case "F":
        return 0;
    }
  }

  static List<DropdownMenuItem<double>> lettersOfCourses() {
    return _lettersOfCourses()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _letterConverter(e),
            ))
        .toList();
  }

  static List<int> _credits() {
    //birden 10 kadar bir int array oluşturur
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allCredits() {
    return _credits()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }

  static List<Course> allToBeAddedCourses = [];
  static addCourse(Course course) {
    allToBeAddedCourses.add(course);
  }

  static calculateGPA() {
    double totalCredit = 0;
    double totalPoint = 0;
    allToBeAddedCourses.forEach((element) {
      totalPoint += (element.letterValue * element.creditValue);
      totalCredit += element.creditValue;
    });
    return totalPoint / totalCredit;
  }
}
