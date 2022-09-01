import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa_calculator/constants/app_constants.dart';
import 'package:gpa_calculator/helper/data_helper.dart';
import 'package:gpa_calculator/model/course.dart';
import 'package:gpa_calculator/widgets/course_list.dart';
import 'package:gpa_calculator/widgets/credits_dropdown_widget.dart';
import 'package:gpa_calculator/widgets/letter_dropdown_widget.dart';
import 'package:gpa_calculator/widgets/show_average.dart';

class GpaCalculatorPage extends StatefulWidget {
  const GpaCalculatorPage({Key? key}) : super(key: key);

  @override
  State<GpaCalculatorPage> createState() => _GpaCalculatorPageState();
}

class _GpaCalculatorPageState extends State<GpaCalculatorPage> {
  final textController =
      TextEditingController(); // form içierisindeki texti kontrol etmek için
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double selectedLetterValue = 4.0;
  double selectedValueOfCredit = 4.0;
  String addedCourseName = " ";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //Klavye açılınca oluşan overflow sorunu çözer
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
            child: Text(
          Constants.titleText,
          style: Constants.titleStyle,
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2, //yatayda kapladığı ekrana göre alan
                child: _buildForm(),
              ),
              Expanded(
                flex: 1, //yatayda kapladığı ekrana göre alan
                child: Container(
                  child: ShowAverage(
                      average: DataHelper.calculateGPA(),
                      numberOfCourse: DataHelper.allToBeAddedCourses.length),
                ),
              ),
            ],
          ),
          //ikinci containerın geri kalan tüm alana yayılması için expanded dedik
          Expanded(child: CourseList(
            onDeletedItem: (index) {
              DataHelper.allToBeAddedCourses.removeAt(index);
              print("Element is deleted $index");
              setState(() {});
            },
          ))

          //liste
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: Constants.horizantalPadding,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Constants.horizantalPadding,
                  child: LetterDropDownButton(
                    onLetterSelected: (letter) {
                      selectedLetterValue = letter;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Constants.horizantalPadding,
                  child: CreditDropdown(onCreditSelected: (credit) {
                    selectedValueOfCredit = credit;
                  }),
                ),
              ),
              IconButton(
                  onPressed: _calculateGPA,
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Constants.primaryColor,
                    size: 30,
                  ))
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
      key: formKey,
    );
  }

  _buildTextFormField() {
    return TextFormField(
      controller: textController,
      onSaved: ((newValue) {
        setState(() {
          addedCourseName = newValue!;
        });
      }),
      validator: (s) {
        if (s!.length <= 0) {
          return "Please add a course";
        }
      },
      decoration: InputDecoration(
          suffixIcon: textController.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: Icon(
                    Icons.close,
                  ),
                  onPressed: () {
                    textController.clear();
                  },
                ),
          hintText: "Math",
          border: OutlineInputBorder(
              borderRadius: Constants.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Constants.primaryColor.shade100.withOpacity(0.2)),
    );
  }

  void _calculateGPA() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save(); //kontrolü sağlayıp değeri kaydediyoruz
      var toBeAddedCourse =
          Course(addedCourseName, selectedLetterValue, selectedValueOfCredit);
      DataHelper.addCourse(toBeAddedCourse);
      setState(() {});
    }
  }
}
