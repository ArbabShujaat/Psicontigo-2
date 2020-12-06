import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/doctor/view/views/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletedQuestionaire extends StatelessWidget {
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
          _nextButton(context),
        ],
      ),
    );
  }

  _header() {
    return Header();
  }

  _questionaire() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You\'ve Completed the Questionaire',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 22.5,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  _nextButton(BuildContext context) {
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
        onPressed: () => {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => SignUpScreen()))
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
}
