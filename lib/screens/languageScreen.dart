import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:language_pickers/language_pickers.dart';
import 'package:language_pickers/languages.dart';
import 'package:flutter_ui_kit/screens/userBackground.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  User user = User();
  Language _selectedDialogLanguage =
      LanguagePickerUtils.getLanguageByIsoCode('en');
  var selectedLanguage;
  var initialValue = "Select your Language";

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
          _languagePicker(context),
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
            'What is your preferred Language?',
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

  Widget _buildDialogItem(Language language) => Row(
        children: <Widget>[
          Text(language.name),
          SizedBox(width: 8.0),
          Flexible(child: Text("(${language.isoCode})"))
        ],
      );
  void _openLanguagePickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: LanguagePickerDialog(
                titlePadding: EdgeInsets.all(8.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration: InputDecoration(hintText: 'Search...'),
                isSearchable: true,
                title: Text('Select your language'),
                onValuePicked: (Language language) => setState(() {
                      _selectedDialogLanguage = language;
                      initialValue = _selectedDialogLanguage.name;
                      print(_selectedDialogLanguage.name);
                      print(_selectedDialogLanguage.isoCode);
                      selectedLanguage = _selectedDialogLanguage.name;
                      user.getLanguage(selectedLanguage);
                      print('Model Value');
                      print(user.selectedLanguage);
                    }),
                itemBuilder: _buildDialogItem)),
      );
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
          if (selectedLanguage != null) {
            Get.offAll(UserBackground());
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

  _languagePicker(BuildContext context) {
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
                    textStyle:
                        TextStyle(fontSize: 18, color: Color(0xFF7442c8)))),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Color(0xFF7442c8),
              textDirection: TextDirection.ltr,
            ),
            onPressed: () => _openLanguagePickerDialog(),
          ),
        ],
      ),
    );
  }
}
