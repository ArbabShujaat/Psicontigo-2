import 'package:flutter_ui_kit/custom%20widgets/header.dart';
import 'package:flutter_ui_kit/screens/screen4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  var selectedAge;

  final List<String> _ages = <String>[
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59',
    '60',
    '61',
    '62',
    '63',
    '64',
    '65',
    '66',
    '67',
    '68',
    '69',
    '70',
    '71',
    '72',
    '73',
    '74',
    '75',
    '76',
    '77',
    '78',
    '79',
    '80',
    '81',
    '82',
    '83',
    '84',
    '85',
    '86',
    '87',
    '88',
    '89',
    '90',
    '91',
    '92',
    '93',
    '94',
    '95',
    '96',
    '97',
    '98',
    '99',
  ];

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
          _agePicker(context),
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
            'What is your Age?',
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

  _agePicker(BuildContext context) {
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
          //  Text("Select your Age"),
          FlatButton.icon(
            label: Text(
              "Select your Age",
              style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: 18, color: Color(0xFF7442c8)),
              ),
            ),
            icon: Icon(
              Icons.arrow_drop_down,
              textDirection: TextDirection.ltr,
              color: Color(0xFF7442c8),
            ),
            onPressed: () => showMaterialRadioPicker(
                headerColor: Color(0xFF7442c8),
                context: context,
                backgroundColor: Colors.grey[100],
                headerTextColor: Colors.white,
                buttonTextColor: Color(0xFF7442c8),
                title: "Select your Age",
                items: _ages,
                onChanged: (value) {
                  setState(() {
                    selectedAge = value;
                    print(selectedAge);
                    user.getAge(selectedAge);
                    print("The model Age");
                    print(user.age);
                  });
                  Get.offAll(Screen4());
                }),
          ),
        ],
      ),
    );
  }
}
