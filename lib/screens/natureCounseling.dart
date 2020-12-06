import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/models/user.dart';
import 'package:flutter_ui_kit/screens/preferences.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_kit/custom widgets/genderButtons2.dart';

List<String> _options = [
  'Mental Health Counseling from Christian Perspective',
  'Spiritual Counseling on primarily faith-based matters',
  'Holistic Counseling addressing both psychological and spiritual components',
  'Other',
];
User user = User();

class NatureCounseling extends StatelessWidget {
  String natureCounseling;

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
            'Which best describes the nature of counseling you are seeking?',
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
          _showOptions(),
        ],
      ),
    );
  }

  _assignValues(String value) {
    natureCounseling = value;
    user.getNatureCounseling(natureCounseling);
    print(natureCounseling);
    print("Now the model Value");
    print(user.natureCounseling);
  }

  _navigateNextScreen() {
    // Temporarily to Spiritual but afterwards shift to Preferences
    return Get.offAll(Preferences());
  }

  _showOptions() {
    return Container(
      child: Column(
        children: [
          GenderButtons2(
            boxHeight: 80,
            textSize: 16.0,
            genderValue: _options[0],
            onPress: () {
              _assignValues(_options[0]);
              _navigateNextScreen();
            },
          ),
          GenderButtons2(
            boxHeight: 80,
            textSize: 16.0,
            genderValue: _options[1],
            onPress: () {
              _assignValues(_options[1]);
              _navigateNextScreen();
            },
          ),
          GenderButtons2(
            boxHeight: 100,
            textSize: 16.0,
            genderValue: _options[2],
            onPress: () {
              _assignValues(_options[2]);
              _navigateNextScreen();
            },
          ),
          GenderButtons2(
            boxHeight: 50,
            textSize: 16.0,
            genderValue: _options[3],
            onPress: () {
              _assignValues(_options[3]);
              _navigateNextScreen();
            },
          ),
        ],
      ),
    );
  }
}
