import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/models/user.dart';
import 'package:flutter_ui_kit/screens/prayerLife.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_kit/custom widgets/genderButtons.dart';

List<String> _options = [
  'Less than a year',
  '1-3 Years',
  'More than 3 Years',
  'My Whole Life'
];
User user = User();

class SpiritualBackground extends StatelessWidget {
  String spiritualBackground;
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
          Text(
            'In order to give your counselor the right expectations, please answer a few questions about your spiritual background. How long has your faith been important to you?',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
          ),
          SizedBox(
            height: 5.0,
          ),
          _showReligions(),
        ],
      ),
    );
  }

  _assignValues(String value) {
    spiritualBackground = value;
    user.getBackground(spiritualBackground);
    print(spiritualBackground);
    print("Now the model Value");
    print(user.spiritualBackground);
  }

  _navigateNextScreen() {
    return Get.offAll(PrayerLife());
  }

  _showReligions() {
    return Container(
      child: Column(
        children: [
          for (int i = 0; i < _options.length; i++)
            GenderButtons(
              genderValue: _options[i],
              onPress: () {
                _assignValues(_options[i]);
                _navigateNextScreen();
              },
            ),
        ],
      ),
    );
  }
}
