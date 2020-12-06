import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/models/user.dart';
import 'package:flutter_ui_kit/screens/screen3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_kit/custom widgets/genderButtons.dart';
import 'package:get/get.dart';

final mGrey = Colors.grey[600];

List<String> genders = [
  'Male',
  'Female',
  'Transgender: Female to Male',
  'Transgender: Male to Female',
  'Non-binary',
  'Gender Fluid',
  'Other',
  "I don't know"
];
User user = User();

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool showMore = false;

  bool hideShowMore = false;
  String selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: _body(context),
      ),
    );
  }

  _body(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _header(),
          _questionaire(),
        ],
      ),
    );
  }

  _header() {
    return Header();
  }

  _questionaire() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'What is your Gender?',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          GenderButtons(
            genderValue: genders[0],
            onPress: () {
              _assignGender(genders[0]);
              _navigateScreen3();
            },
          ),
          GenderButtons(
            genderValue: genders[1],
            onPress: () {
              _assignGender(genders[0]);
              _navigateScreen3();
            },
          ),
          SizedBox(
            height: 5.0,
          ),
          hideShowMore ? SizedBox(height: 0.0) : _showMoreButton(),
          showMore ? _showMoreGenders() : SizedBox(height: 0.0),
        ],
      ),
    );
  }

  _showMoreButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          hideShowMore = true;
          showMore = true;
        });
      },
      child: Text(
        'Show More',
        textAlign: TextAlign.left,
        style: GoogleFonts.robotoSlab(
            textStyle: TextStyle(fontSize: 18.0, color: Color(0xFF7442c8))),
      ),
    );
  }

  _assignGender(String value) {
    setState(() {
      selectedGender = value;
      user.getGender(selectedGender);
      print(selectedGender);
      print("Now the model Gender");
      print(user.gender);
    });
  }

  _navigateScreen3() {
    return Get.offAll(Screen3());
  }

  _showMoreGenders() {
    return Container(
      child: Column(
        children: [
          for (int i = 2; i < genders.length; i++)
            GenderButtons(
              genderValue: genders[i],
              onPress: () {
                _assignGender(genders[i]);
                _navigateScreen3();
              },
            ),
        ],
      ),
    );
  }
}
