import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/models/user.dart';
import 'package:flutter_ui_kit/screens/countryScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_kit/custom widgets/genderButtons.dart';
import 'package:get/get.dart';

List<String> _options = [
  'TV Ad',
  'Snapchat',
  'Social Media Post',
  'Podcast',
  'Youtube',
  'Poster or Billboard',
  'Friend or Family Member',
  'Radio',
  'Megazine or Newspaper',
  'Other'
];
User user = User();

class Reference extends StatelessWidget {
  String methodOfCommunication;

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
            'Who referred you to Psicontigo?',
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
    methodOfCommunication = value;
    user.getMethodCommunication(methodOfCommunication);
    print(methodOfCommunication);
    print("Now the model Value");
    print(user.methodCommunication);
  }

  _navigateNextScreen() {
    return Get.offAll(CountryScreen());
  }

  _showOptions() {
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
