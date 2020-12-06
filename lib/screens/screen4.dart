import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/models/user.dart';
import 'package:flutter_ui_kit/screens/screen5.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_kit/custom widgets/genderButtons.dart';
import 'package:get/get.dart';

List<String> orientation = [
  'Straight',
  'Gay',
  'Lesbian',
  'Bisexual',
  'Questioning',
  'Pansexual',
  'Queer',
  'Asexual',
  "I don't know",
  'Other'
];
User user = User();

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  bool showMore = false;

  bool hideShowMore = false;
  String selectedOrientation;
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
              'What is your Orientation?',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          GenderButtons(
            genderValue: orientation[0],
            onPress: () {
              _assignGender(orientation[0]);
              _navigateScreen5();
            },
          ),
          GenderButtons(
            genderValue: orientation[1],
            onPress: () {
              _assignGender(orientation[1]);
              _navigateScreen5();
            },
          ),
          GenderButtons(
            genderValue: orientation[2],
            onPress: () {
              _assignGender(orientation[2]);
              _navigateScreen5();
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
        style: GoogleFonts.robotoSlab(
            textStyle: TextStyle(fontSize: 18.0, color: Color(0xFF7442c8))),
      ),
    );
  }

  _assignGender(String value) {
    setState(() {
      selectedOrientation = value;
      user.getOrientation(selectedOrientation);
      print(selectedOrientation);
      print("Now the model Gender");
      print(user.orientation);
    });
  }

  _navigateScreen5() {
    return Get.offAll(Screen5());
  }

  _showMoreGenders() {
    return Container(
      child: Column(
        children: [
          for (int i = 3; i < orientation.length; i++)
            GenderButtons(
              genderValue: orientation[i],
              onPress: () {
                _assignGender(orientation[i]);
                _navigateScreen5();
              },
            ),
        ],
      ),
    );
  }
}
