import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/models/user.dart';
import 'package:flutter_ui_kit/screens/christianDenomination.dart';
import 'package:flutter_ui_kit/screens/spiritual.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_kit/custom widgets/genderButtons.dart';
import 'package:get/get.dart';

List<String> _religions = ['Christianity', 'Judaism', 'Islam', 'Other'];
User user = User();

class Religions extends StatelessWidget {
  String selectedReligion;
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
            'Which religion do you identify with?',
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
    selectedReligion = value;
    user.getReligion(selectedReligion);
    print(selectedReligion);
    print("Now the model Religious Status");
    print(user.religion);
  }

  _navigateNextScreen() {
    if (selectedReligion == 'Christianity') {
      return Get.offAll(ChristianDenominations());
    } else {
      return Get.offAll(Spiritual());
    }
  }

  _showReligions() {
    return Container(
      child: Column(
        children: [
          for (int i = 0; i < _religions.length; i++)
            GenderButtons(
              genderValue: _religions[i],
              onPress: () {
                _assignValues(_religions[i]);
                _navigateNextScreen();
              },
            ),
        ],
      ),
    );
  }
}
