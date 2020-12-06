import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_kit/custom widgets/checkBoxCustom.dart';
import 'package:get/get.dart';
import 'package:flutter_ui_kit/models/userPreferences.dart';
import 'package:flutter_ui_kit/screens/completedQuestionaire.dart';

List<UserPreferences> _options = [
  UserPreferences(value: "I'm a student", status: false),
  UserPreferences(value: "I'm a veteran", status: false),
  UserPreferences(value: "I'm disabled", status: false),
  UserPreferences(value: "I'm unemployed", status: false),
  UserPreferences(value: "I'm employed but my income is low", status: false),
  UserPreferences(
      value: "I'm financially impacted by the corona virus outbreak",
      status: false),
];
User user = User();

class UserBackground extends StatefulWidget {
  @override
  _UserBackgroundState createState() => _UserBackgroundState();
}

class _UserBackgroundState extends State<UserBackground> {
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
          _nextButton(),
        ],
      ),
    );
  }

  _header() {
    return Header();
  }

  _nextButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
      padding: EdgeInsets.only(left: 5.0, top: 10.0, bottom: 10.0, right: 5.0),
      decoration: BoxDecoration(
        color: Color(0xFF7442c8),
        borderRadius: BorderRadius.circular(9.0),
      ),
      height: 50,
      width: 310,
      child: FlatButton(
        onPressed: () {
          if (_options[0].status != false ||
              _options[1].status != false ||
              _options[2].status != false ||
              _options[3].status != false) {
            Get.offAll(CompletedQuestionaire());
          }
        },
        child: Text('Next',
            textAlign: TextAlign.left,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
            ))),
      ),
    );
  }

  _questionaire() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Please mark all that apply)',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          _showOptions(),
        ],
      ),
    );
  }

  _customCheckOption(int index) {
    return CheckBoxCustom(
      text: _options[index].value,
      value: _options[index].status,
      onPress: (bool val) {
        setState(() {
          _options[index].status = val;
        });
        if (_options[index].status) {
          print('Value Changed');
        }
      },
    );
  }

  _showOptions() {
    return Column(
      children: [
        for (int index = 0; index < _options.length; index++)
          _customCheckOption(index),
      ],
    );
  }
}
