import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SocialSignIn extends StatelessWidget {
  final Function googleAction;
  final Function facebookAction;
  SocialSignIn({this.facebookAction, this.googleAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          width: 320,
          height: 40,
          child: SignInButton(Buttons.FacebookNew,
              text: 'Continue with Facebook', onPressed: facebookAction),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
          margin: EdgeInsets.symmetric(vertical: 5.0),
          width: 320,
          height: 40,
          child: SignInButton(Buttons.Google,
              text: 'Continue with Google', onPressed: googleAction),
        ),
      ],
    );
  }
}
