import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/provider/auth_provider.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/payment/payment_setup_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/custom_app_bar.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/edittext/custom_text_field.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/textfield_title_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class PatientsDetails extends StatefulWidget {
  @override
  _PatientsDetailsState createState() => _PatientsDetailsState();
}

class _PatientsDetailsState extends State<PatientsDetails> {
  bool isMale = true;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _statusController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  int ageIndex = -1;

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false)
        .initializeCountryCodeList();

    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CustomAppBar(title: Strings.PATIENT_DETAILS),
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_WHITE.withOpacity(.6),
                        borderRadius: BorderRadius.circular(5)),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: ColorResources.COLOR_PRIMARY,
                        size: 17,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(right: 50),
                    alignment: Alignment.center,
                    child: Text(Strings.PATIENT_DETAILS,
                        style: khulaSemiBold.copyWith(
                            fontSize: 16, color: ColorResources.COLOR_GREY)),
                  )),
                  FlatButton(
                    onPressed: () {},
                    child: Text("Skip",
                        style: khulaSemiBold.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorResources.COLOR_PRIMARY,
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        )),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  // write your status
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("What brings you here?",
                            style: khulaSemiBold.copyWith(
                              color: ColorResources.COLOR_PRIMARY,
                              fontSize: Dimensions.FONT_SIZE_LARGE,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorResources.COLOR_GAINSBORO),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            cursorColor: ColorResources.COLOR_GREY,
                            maxLines: null,
                            controller: _statusController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: Strings.LOREM__FACILLIS,
                              hintStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                //height: 12.5,
                              ),
                              hintMaxLines: 4,
                              labelStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // write your status
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Have you seen counselor before?",
                            style: khulaSemiBold.copyWith(
                              color: ColorResources.COLOR_PRIMARY,
                              fontSize: Dimensions.FONT_SIZE_LARGE,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorResources.COLOR_GAINSBORO),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            cursorColor: ColorResources.COLOR_GREY,
                            maxLines: null,
                            controller: _statusController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: Strings.LOREM__FACILLIS,
                              hintStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                //height: 12.5,
                              ),
                              hintMaxLines: 4,
                              labelStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // write your status
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("What is the problem from your point of view?",
                            style: khulaSemiBold.copyWith(
                              color: ColorResources.COLOR_PRIMARY,
                              fontSize: Dimensions.FONT_SIZE_LARGE,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorResources.COLOR_GAINSBORO),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            cursorColor: ColorResources.COLOR_GREY,
                            maxLines: null,
                            controller: _statusController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: Strings.LOREM__FACILLIS,
                              hintStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                //height: 12.5,
                              ),
                              hintMaxLines: 4,
                              labelStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // write your status
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Have you ever tought about sucide?",
                            style: khulaSemiBold.copyWith(
                              color: ColorResources.COLOR_PRIMARY,
                              fontSize: Dimensions.FONT_SIZE_LARGE,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorResources.COLOR_GAINSBORO),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            cursorColor: ColorResources.COLOR_GREY,
                            maxLines: null,
                            controller: _statusController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: Strings.LOREM__FACILLIS,
                              hintStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                //height: 12.5,
                              ),
                              hintMaxLines: 4,
                              labelStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // write your status
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("What makes te problem better?",
                            style: khulaSemiBold.copyWith(
                              color: ColorResources.COLOR_PRIMARY,
                              fontSize: Dimensions.FONT_SIZE_LARGE,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorResources.COLOR_GAINSBORO),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            cursorColor: ColorResources.COLOR_GREY,
                            maxLines: null,
                            controller: _statusController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: Strings.LOREM__FACILLIS,
                              hintStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                //height: 12.5,
                              ),
                              hintMaxLines: 4,
                              labelStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // write your status
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Overall, How you describe your mood?",
                            style: khulaSemiBold.copyWith(
                              color: ColorResources.COLOR_PRIMARY,
                              fontSize: Dimensions.FONT_SIZE_LARGE,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorResources.COLOR_GAINSBORO),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            cursorColor: ColorResources.COLOR_GREY,
                            maxLines: null,
                            controller: _statusController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: Strings.LOREM__FACILLIS,
                              hintStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                //height: 12.5,
                              ),
                              hintMaxLines: 4,
                              labelStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // write your status
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("What do you expect from the counselling process?",
                            style: khulaSemiBold.copyWith(
                              color: ColorResources.COLOR_PRIMARY,
                              fontSize: Dimensions.FONT_SIZE_LARGE,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorResources.COLOR_GAINSBORO),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            cursorColor: ColorResources.COLOR_GREY,
                            maxLines: null,
                            controller: _statusController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: Strings.LOREM__FACILLIS,
                              hintStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                //height: 12.5,
                              ),
                              hintMaxLines: 4,
                              labelStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // write your status
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "What would it take to make you feel happier and satisfied?",
                            style: khulaSemiBold.copyWith(
                              color: ColorResources.COLOR_PRIMARY,
                              fontSize: Dimensions.FONT_SIZE_LARGE,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorResources.COLOR_GAINSBORO),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            cursorColor: ColorResources.COLOR_GREY,
                            maxLines: null,
                            controller: _statusController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: Strings.LOREM__FACILLIS,
                              hintStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                //height: 12.5,
                              ),
                              hintMaxLines: 4,
                              labelStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // write your status
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Any othe thing you would love your psychologist to know?",
                            style: khulaSemiBold.copyWith(
                              color: ColorResources.COLOR_PRIMARY,
                              fontSize: Dimensions.FONT_SIZE_LARGE,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorResources.COLOR_GAINSBORO),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            cursorColor: ColorResources.COLOR_GREY,
                            maxLines: null,
                            controller: _statusController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: Strings.LOREM__FACILLIS,
                              hintStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                //height: 12.5,
                              ),
                              hintMaxLines: 4,
                              labelStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: CustomButton(
                btnTxt: Strings.CONTINUE,
                onTap: () {
                  pushNewScreen(
                    context,
                    screen: PaymentSetupScreen(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
