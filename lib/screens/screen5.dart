import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/models/user.dart';
import 'package:flutter_ui_kit/screens/screen6.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_kit/custom widgets/genderButtons.dart';
import 'package:get/get.dart';

final mGrey = Colors.grey[600];

List<String> _relationshipStatus = [
  'Single',
  'In a Relationship',
  'Married',
  'Divorced',
  'Widowed',
  'Other',
];
User user = User();

class Screen5 extends StatelessWidget {
  String selectedStatus;
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
              'What is your Relationship Status?',
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
          _showMoreGenders(),
        ],
      ),
    );
  }

  _assignGender(String value) {
    selectedStatus = value;
    user.getStatus(selectedStatus);
    print(selectedStatus);
    print("Now the model Gender");
    print(user.status);
  }

  _navigateNextScreen() {
    return Get.offAll(Screen6());
  }

  _showMoreGenders() {
    return Container(
      child: Column(
        children: [
          for (int i = 0; i < _relationshipStatus.length; i++)
            GenderButtons(
              genderValue: _relationshipStatus[i],
              onPress: () {
                _assignGender(_relationshipStatus[i]);
                _navigateNextScreen();
              },
            ),
        ],
      ),
    );
  }
}
