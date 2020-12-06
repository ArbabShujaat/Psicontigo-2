import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderButtons extends StatelessWidget {
  final Function onPress;
  final String genderValue;
  GenderButtons({this.genderValue, this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.0, bottom: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      height: 55.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.0),
        boxShadow: [
          BoxShadow(
              blurRadius: 4,
              spreadRadius: 2.0,
              color: Colors.grey[600],
              offset: Offset(0.5, 3)),
        ],
        color: //Colors.white
            Color(0xFF7442c8),
      ),
      child: FlatButton(
        onPressed: onPress,
        child: Text(
          genderValue,
          textAlign: TextAlign.left,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                color: //Color(0xFF8a2be2)
                    //Colors.blue[900],
                    Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
