import 'package:flutter_ui_kit/constants.dart';
import 'package:flutter_ui_kit/custom%20widgets/secHeader.dart';
import 'package:flutter_ui_kit/custom%20widgets/socialSignIn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String error = '';

  String name = '';

  String email = '';

  String confirmEmail = '';

  String password = '';

  bool agree = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: _body(),
      ),
    );
  }

  _body() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _header(),
          _socialSignIn(),
          _loginArea(),
          _nextButton(),
        ],
      ),
    );
  }

  _header() {
    return SecHeader();
  }

  _socialSignIn() {
    return SocialSignIn(
      googleAction: () {},
      facebookAction: () {},
    );
  }

  _loginArea() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 400.0,
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              color: Colors.grey[200],
              child: TextFormField(
                validator: (val) => val.isEmpty ? 'Enter a name' : null,
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey[700],
                  hintText: 'First Name (or Nickname)',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[700],
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 400.0,
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              color: Colors.grey[200],
              child: TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an Valid Email' : null,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey[700],
                  hintText: 'Email',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[700],
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 400.0,
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              color: Colors.grey[200],
              child: TextFormField(
                validator: (val) {
                  if (val.isEmpty) return 'Enter an Email';
                  if (val != email)
                    return 'Both Email should match';
                  else
                    return null;
                },
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey[700],
                  hintText: 'Confirm Email',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[700],
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 400.0,
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              color: Colors.grey[200],
              child: TextFormField(
                validator: (val) => val.length < 6
                    ? 'Create a Strong password with more than 6 Chars'
                    : null,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey[700],
                  hintText: 'Create Password',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.brown[700],
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            _check(),
          ],
        ),
      ),
    );
  }

  _check() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0, top: 10.0),
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: kDBlue),
            child: Checkbox(
              value: agree,
              onChanged: (val) {
                setState(() {
                  agree = val;
                });
              },
            ),
          ),
          Flexible(
            child: Text('I agree to the terms and conditions',
                textAlign: TextAlign.left,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 16.4,
                        fontWeight: FontWeight.w500,
                        color: kDBlue))),
          ),
        ],
      ),
    );
  }

  _nextButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      padding: EdgeInsets.only(left: 5.0, top: 10.0, bottom: 10.0, right: 5.0),
      decoration: BoxDecoration(
        color: kDBlue,
        borderRadius: BorderRadius.circular(7.0),
      ),
      height: 45,
      width: 310,
      child: FlatButton(
        onPressed: () async {
          if (_formKey.currentState.validate()) print('True');
          if (email.isNotEmpty &&
              name.isNotEmpty &&
              confirmEmail.isNotEmpty &&
              password.isNotEmpty &&
              agree != false) {
            print('Go Forward');
          }
        },
        child: Text('Get Started',
            textAlign: TextAlign.left,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
              color: Colors.white,
              letterSpacing: 0.5,
              fontSize: 19.0,
              fontWeight: FontWeight.w500,
            ))),
      ),
    );
  }
}
