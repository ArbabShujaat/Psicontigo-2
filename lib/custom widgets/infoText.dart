import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_kit/constants.dart';

class InfoText extends StatelessWidget {
  final String heading;
  final String description;
  final double upperSpace;
  final double height;
  final double size;
  InfoText(
      {this.heading,
      this.description,
      this.height,
      this.upperSpace,
      this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: upperSpace, bottom: 5.0, left: 24.0, right: 24.0),
      padding:
          EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
      height: height,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0), color: kDDBlue),
      child: Row(
        children: [
          CircleAvatar(
            radius: 33,
            backgroundImage: AssetImage('images/Female.jpg'),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  heading,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: size,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  description,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
