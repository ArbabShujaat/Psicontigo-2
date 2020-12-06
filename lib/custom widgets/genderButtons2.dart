import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderButtons2 extends StatelessWidget {
  final Function onPress;
  final String genderValue;
  final double boxHeight;
  final double textSize;
  GenderButtons2(
      {this.genderValue, this.onPress, this.boxHeight, this.textSize});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 12.0, bottom: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
        height: boxHeight,
        width: double.maxFinite,
        child: Center(
          child: Text(genderValue,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                color: Colors.white,
                fontSize: textSize,
                fontWeight: FontWeight.w500,
              ))),
        ),
      ),
    );
  }
}
