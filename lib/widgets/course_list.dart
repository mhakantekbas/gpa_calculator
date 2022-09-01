import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';
import '../model/course.dart';

class CourseList extends StatelessWidget {
  final Function onDeletedItem;
  const CourseList({required this.onDeletedItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Course> allCourses = DataHelper.allToBeAddedCourses;
    return allCourses.length > 0
        ? ListView.builder(
            itemCount: allCourses.length,
            itemBuilder: ((context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onDeletedItem(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                        title: Text(allCourses[index].name),
                        subtitle: Text(
                            "${allCourses[index].creditValue} Credit, Value of letter ${allCourses[index].letterValue} "),
                        leading: CircleAvatar(
                          child: Text(allCourses[index].name.substring(0, 2)),
                          backgroundColor: Constants.primaryColor,
                        )),
                  ),
                ),
              );
            }),
          )
        : Center(
            child: Container(
                child: Text(
            "Please Add a Course",
            style: Constants.titleStyle,
          )));
  }
}
