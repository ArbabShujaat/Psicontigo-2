import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color myP = Color(0xFF522F81);

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final Color color;
  final IconData ourIcon;
  CustomButton({this.text, this.onPress, this.color, this.ourIcon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.0, bottom: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      height: 60.0,
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
        child: Row(
          children: [
            Icon(
              ourIcon,
              color: //Colors.blue[900]
                  Colors.white,
            ),
            SizedBox(
              width: 30.0,
            ),
            Flexible(
              child: Text(
                text,
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
          ],
        ),
      ),
    );
  }
}
