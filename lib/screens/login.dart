import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_kit/custom widgets/header.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String error = '';

  String email = '';

  String password = '';

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
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        //  padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Header(),
            _bodyText(),
            _loginArea(),
          ],
        ),
      ),
    );
  }

  _bodyText() {
    return Text('Welcome Back!',
        style: GoogleFonts.robotoSlab(
            textStyle: TextStyle(fontSize: 25.0, color: Colors.grey[700])));
  }

  _loginArea() {
    return Form(
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
              validator: (val) => val.isEmpty ? 'Enter an Email' : null,
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(
                fillColor: Colors.grey[700],
                hintText: 'Enter your Email Address',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF7442c8),
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
              validator: (val) => val.length < 6 ? 'Enter a password' : null,
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(
                fillColor: Colors.grey[700],
                hintText: 'Enter your Password',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF7442c8),
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              // works only and only if the validators return null
              if (_formKey.currentState.validate()) {
                print('True');
              }
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0),
                color: Color(0xFF7442c8),
              ),
              child: Center(
                child: Text(
                  'Log In',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.white),
                      fontSize: 17.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 12.0),
          GestureDetector(
            onTap: () {},
            child: Text('Forgot Password?',
                style: GoogleFonts.robotoSlab(
                    textStyle:
                        TextStyle(fontSize: 15.0, color: Color(0xFF7442c8)))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {},
            child: Center(
              child: Text(
                "Don't have an account? Sign Up",
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    textStyle: TextStyle(color: Color(0xFF7442c8)),
                    fontSize: 15.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
