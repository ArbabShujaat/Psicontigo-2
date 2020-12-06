import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/models/user.dart';
import 'package:flutter_ui_kit/screens/spiritualBackground.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_kit/custom widgets/genderButtons.dart';
import 'package:get/get.dart';

List<String> _options = [
  'Protestant',
  'Catholic',
  'Orthodox',
  'Anglican',
  'Presbyterian',
  'Baptist',
  'Lutheran',
  'Methodist',
  'Other',
  'Non-Denominational',
  'Not Sure',
  'Not a Christian'
];
User user = User();

class ChristianDenominations extends StatefulWidget {
  @override
  _ChristianDenominationsState createState() => _ChristianDenominationsState();
}

class _ChristianDenominationsState extends State<ChristianDenominations> {
  String denomination;
  bool showMore = false;
  bool hideShowMore = false;

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
            'If you identify yourself as a Christian which denomination best describes you?',
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
          _showOptions(0, 4),
          hideShowMore ? SizedBox(height: 0.0) : _showMoreButton(),
          showMore ? _showOptions(5, _options.length) : SizedBox(height: 0.0),
        ],
      ),
    );
  }

  _showMoreButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          hideShowMore = true;
          showMore = true;
        });
      },
      child: Text(
        'Show More',
        style: GoogleFonts.robotoSlab(
            textStyle: TextStyle(fontSize: 18.0, color: Color(0xFF7442c8))),
      ),
    );
  }

  _assignValues(String value) {
    setState(() {
      denomination = value;
      user.getDenomination(denomination);
      print(denomination);
      print("Now the model Value");
      print(user.denomination);
    });
  }

  _navigateNextScreen() {
    return Get.offAll(SpiritualBackground());
  }

  _showOptions(int start, int end) {
    return Container(
      child: Column(
        children: [
          for (int i = start; i < end; i++)
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
