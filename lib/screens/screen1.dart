import 'package:flutter_ui_kit/constants.dart';
import 'package:flutter_ui_kit/custom%20widgets/customButton.dart';
import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/screens/login.dart';
import 'package:flutter_ui_kit/screens/screen2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final mGrey = Colors.grey[600];
TextStyle kLine1 = GoogleFonts.lato(
    textStyle: TextStyle(
        color: Colors.grey[700], fontSize: 16, fontWeight: FontWeight.w400));

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
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
          _questionaire(context),
          _login(),
        ],
      ),
    );
  }

  _header() {
    return Header();
  }

  _questionaire(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
      child: Column(
        children: [
          Text(
            'What type of counseling are\nyou looking for?',
            style: kLine1,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.0,
          ),
          CustomButton(
            text: 'Individual Counseling\n(for myself)',
            onPress: () {
              Get.to(Screen2());
            },
            color: kDBlue,
            ourIcon: FontAwesomeIcons.personBooth,
          ),
          CustomButton(
            text: 'Couple Counseling\n(for myself & my partner)',
            onPress: () {
              // _showAlert(context);
              Get.to(Screen2());
            },
            color: kTBlue,
            ourIcon: FontAwesomeIcons.peopleArrows,
          ),
          CustomButton(
            text: 'Teenage Counseling\n(for my child)',
            onPress: () {
              Get.to(Screen2());
            },
            color: kRed,
            ourIcon: FontAwesomeIcons.child,
          ),
        ],
      ),
    );
  }

  _login() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 5.0),
      child: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          SizedBox(
            height: 1.0,
            child: Container(
              color: Color(0xFF7442c8),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          FlatButton(
            onPressed: () {
              Get.to(LogIn());
            },
            child: Text(
              'Already Registered? Login',
              style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Color(0xFF7442c8),
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
