import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/provider/auth_provider.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/auth/signin_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/profile_edit_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/edittext/custom_pass_field.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/edittext/custom_text_field.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/textfield_title_widget.dart';
import 'package:provider/provider.dart';

import 'widget/social_media_widget.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false)
        .initializeCountryCodeList();
    FocusNode _emailNode = FocusNode();
    FocusNode _passNode = FocusNode();
    FocusNode _nameNode = FocusNode();
    FocusNode _phoneNode = FocusNode();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/doctor/images/splash_logo.png',
                height: 210,
                width: 200,
              ),
              SizedBox(
                height: 20.0,
              ),
              // for email
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.MARGIN_SIZE_DEFAULT,
                    right: Dimensions.MARGIN_SIZE_DEFAULT,
                    bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                child: Stack(
                  children: [
                    TextFieldTitleWidget(
                      imageUrl: 'assets/doctor/Icon/email.png',
                      title: Strings.EMAIL,
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                      child: CustomTextField(
                        hintTxt: Strings.NIPON_MAIL,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        focusNode: _emailNode,
                        nextNode: _nameNode,
                        isEmail: true,
                        controller: _emailController,
                      ),
                    ),
                  ],
                ),
              ),

              // for Name
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.MARGIN_SIZE_DEFAULT,
                    right: Dimensions.MARGIN_SIZE_DEFAULT,
                    bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                child: Stack(
                  children: [
                    TextFieldTitleWidget(
                      imageUrl: 'assets/doctor/Icon/people.png',
                      title: Strings.NAME,
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                      child: CustomTextField(
                        hintTxt: Strings.ENTER_YOUR_NAME,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        focusNode: _nameNode,
                        nextNode: _phoneNode,
                        controller: _nameController,
                      ),
                    ),
                  ],
                ),
              ),

              // for phone number
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.MARGIN_SIZE_DEFAULT,
                    right: Dimensions.MARGIN_SIZE_DEFAULT,
                    bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                child: Stack(
                  children: [
                    TextFieldTitleWidget(
                      imageUrl: 'assets/doctor/Icon/phone 2.png',
                      title: Strings.PHONE,
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                      child: Consumer<AuthProvider>(
                          builder: (context, profileProvider, child) {
                        return Row(
                          children: [
                            Expanded(
                              child: Container(
                                //alignment: Alignment.center,
                                child: DropdownButton<String>(
                                  value: profileProvider.countryCode ?? '',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: ColorResources.COLOR_GREY,
                                  ),
                                  iconSize: 20,
                                  elevation: 16,
                                  style: khulaSemiBold.copyWith(
                                      color: ColorResources.COLOR_GREY,
                                      fontSize: Dimensions.FONT_SIZE_SMALL),
                                  underline: SizedBox(),
                                  onChanged: profileProvider.updateCountryCode,
                                  items: profileProvider.countryCodeList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: CustomTextField(
                                  hintTxt: Strings.ENTER_YOUR_PHONE_NO,
                                  textInputType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  focusNode: _phoneNode,
                                  nextNode: _passNode,
                                  isPhoneNumber: true,
                                  controller: _phoneController,
                                )),
                          ],
                        );
                      }),
                    ),
                    Positioned(
                      bottom: 7,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 1,
                        color: ColorResources.COLOR_GAINSBORO,
                      ),
                    ),
                  ],
                ),
              ),

              // for password
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.MARGIN_SIZE_DEFAULT,
                    right: Dimensions.MARGIN_SIZE_DEFAULT,
                    bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                child: Stack(
                  children: [
                    TextFieldTitleWidget(
                      imageUrl: 'assets/doctor/Icon/security.png',
                      title: Strings.PASSWORD,
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                      child: CustomPassField(
                        hintTxt: Strings.ENTER_YOUR_PASSWORD,
                        textInputAction: TextInputAction.done,
                        focusNode: _passNode,
                        controller: _passwordController,
                      ),
                    ),
                  ],
                ),
              ),

              // for signin button
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: Dimensions.MARGIN_SIZE_DEFAULT,
                  right: Dimensions.MARGIN_SIZE_DEFAULT,
                ),
                child: CustomButton(
                  btnTxt: Strings.SIGN_UP,
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ProfileEditScreen(fromSetting: false)));
                  },
                ),
              ),

              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.ALREADY_HAVE_AN_ACCOUNT,
                      style: khulaSemiBold.copyWith(
                          color: ColorResources.COLOR_GREY,
                          fontSize: Dimensions.FONT_SIZE_SMALL),
                    ),
                    Text(
                      Strings.SIGN_IN,
                      style: khulaSemiBold.copyWith(
                          color: ColorResources.COLOR_PRIMARY,
                          fontSize: Dimensions.FONT_SIZE_SMALL),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.all(Dimensions.MARGIN_SIZE_DEFAULT),
                child: Row(
                  children: [
                    Text(
                      Strings.OR_SIGN_IN,
                      style: khulaRegular.copyWith(
                        color: ColorResources.COLOR_GREY,
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        width: 10,
                        color: ColorResources.COLOR_GAINSBORO,
                      ),
                    ),
                  ],
                ),
              ),

              // for or sign in
              Container(
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT),
                child: Row(
                  children: [
                    SocialMediaWidget(
                      imageUrl: 'assets/doctor/Icon/google.png',
                    ),
                    SocialMediaWidget(
                      imageUrl: 'assets/doctor/Icon/facebook.png',
                    ),
                    // SocialMediaWidget(
                    //   imageUrl: 'assets/doctor/Icon/twitter.png',
                    // ),
                    // SocialMediaWidget(
                    //   imageUrl: 'assets/doctor/Icon/instagram.png',
                    // ),
                  ],
                ),
              ),

              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
