import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBoxCustom extends StatelessWidget {
  final bool value;
  final String text;
  final Function onPress;
  CheckBoxCustom({this.onPress, this.text, this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Checkbox(
            checkColor: Colors.white,
            activeColor: Color(0xFF7442c8),
            value: value,
            onChanged: onPress,
          ),
          Flexible(
            child: Text(text,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ))),
          ),
        ],
      ),
    );
  }
}
