import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/models/user.dart';
import 'package:flutter_ui_kit/screens/languageScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';

class CountryScreen extends StatefulWidget {
  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  var initialValue = "Select your country";
  var selectedCountry;
  User user = User();
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
          _countryPicker(context),
          _nextButton(),
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
            'Which Country are you in?',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
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
          if (selectedCountry != null) {
            Get.offAll(LanguageScreen());
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

  _countryPicker(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      //padding: EdgeInsets.only(left: 5.0),
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF7442c8)),
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //  Text("Select your Country"),
          FlatButton.icon(
            label: Text(initialValue,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF7442c8),
                ))),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Color(0xFF7442c8),
              textDirection: TextDirection.ltr,
            ),
            onPressed: () => showCountryPicker(
              context: context,
              showPhoneCode: false,
              onSelect: (Country country) {
                print('Select country: ${country.displayName}');
                setState(() {
                  selectedCountry = country.displayNameNoCountryCode;
                  initialValue = country.displayNameNoCountryCode;
                  print(selectedCountry);
                  user.getCountry(selectedCountry);
                  print('Model Value');
                  print(user.selectedCountry);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
