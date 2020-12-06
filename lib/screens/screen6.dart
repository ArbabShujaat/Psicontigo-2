import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/models/user.dart';
import 'package:flutter_ui_kit/screens/religions.dart';
import 'package:flutter_ui_kit/screens/spiritual.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_kit/custom widgets/genderButtons.dart';

List<String> _religiousStatus = [
  'No',
  'Yes',
];
User user = User();

class Screen6 extends StatelessWidget {
  String selectedReligiousStatus;
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
              'Do you consider yourself to be religious?',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          _showReligiousStatuses(),
        ],
      ),
    );
  }

  _assignReligiousStatus(String value) {
    selectedReligiousStatus = value;
    user.getReligiousStatus(selectedReligiousStatus);
    print(selectedReligiousStatus);
    print("Now the model Religious Status");
    print(user.religiousStatus);
  }

  _navigateNextScreen() {
    if (user.religiousStatus == 'Yes') {
      return Get.off(Religions());
    } else if (user.religiousStatus == 'No') {
      return Get.offAll(Spiritual());
    }
  }

  _showReligiousStatuses() {
    return Container(
      child: Column(
        children: [
          for (int i = 0; i < _religiousStatus.length; i++)
            GenderButtons(
              genderValue: _religiousStatus[i],
              onPress: () {
                _assignReligiousStatus(_religiousStatus[i]);
                _navigateNextScreen();
              },
            ),
        ],
      ),
    );
  }
}
