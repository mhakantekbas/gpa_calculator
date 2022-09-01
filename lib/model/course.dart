import 'package:flutter/cupertino.dart';

class Course {
  final String name;
  final double letterValue;
  final double creditValue;

  Course(this.name, this.letterValue, this.creditValue);
  //normal parantezler içerisinde olması hepsini required yapar
  //required yapmamamk için süslü parantez içinde yazarız

  @override
  String toString() {
    // TODO: implement toString
    return "$name - $letterValue - $creditValue";
  }
}
