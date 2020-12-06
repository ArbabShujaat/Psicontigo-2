import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/models/user.dart';
import 'package:flutter_ui_kit/screens/natureCounseling.dart';
import 'package:flutter_ui_kit/screens/spiritual.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_kit/custom widgets/genderButtons.dart';

List<String> _options = ['No', 'Yes'];
User user = User();

class ReligiousCounselor extends StatelessWidget {
  String needReligiousCounselor;
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
            'Would you liked to be matched with a counselor who provides Christian based Counseling?',
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
    needReligiousCounselor = value;
    user.getReligiousCounselor(needReligiousCounselor);
    print(needReligiousCounselor);
    print("Now the model ReligiousCounselor");
    print(user.religiousCounseling);
  }

  _navigateNextScreen() {
    if (needReligiousCounselor == 'Yes') {
      return Get.offAll(NatureCounseling());
    } else {
      return Get.offAll(Spiritual());
    }
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
