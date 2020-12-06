import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/helper/utils.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/home_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/incoming_call_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/startup_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/write_a_review_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/custom_app_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'audio_calling_screen.dart';
import 'chat_screen.dart';

class OnlineAppointmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Column(
          children: [
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
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => StartupScreen()),
                            (Route<dynamic> route) => false);
                      },
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(right: 50),
                    alignment: Alignment.center,
                    child: Text(Strings.ONLINE_APPOINTMENTS,
                        style: khulaSemiBold.copyWith(
                            fontSize: 16, color: ColorResources.COLOR_GREY)),
                  )),
                ],
              ),
            ),
            // for doctor name
            Container(
              height: 86,
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: ColorResources.COLOR_WHITE,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/doctor/images/doctor1.jpg',
                      height: double.infinity,
                      fit: BoxFit.fill,
                      width: 70,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.DOCTOR_NAME1,
                          style: khulaSemiBold.copyWith(
                            fontSize: 20,
                            color: ColorResources.COLOR_CONFLOWER_BLUE,
                          ),
                        ),
                        Text(
                          Strings.HEART__HOSPITAL,
                          style: khulaRegular.copyWith(
                            fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                            color: ColorResources.COLOR_GREY,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_PRIMARY,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(42),
                          topRight: Radius.circular(42))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                ),
                Ink(
                  color: ColorResources.COLOR_PRIMARY,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_HOME_BACKGROUND,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(42),
                            topRight: Radius.circular(42))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/doctor/Icon/time 2.png',
                              width: 17,
                              height: 17,
                              fit: BoxFit.fill,
                              color: ColorResources.COLOR_GREY,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Appointment time",
                                  style: khulaSemiBold.copyWith(
                                    color: ColorResources.COLOR_GREY,
                                  ),
                                ),
                                Text(
                                  Strings.MORNING,
                                  style: khulaRegular.copyWith(
                                    color: ColorResources.COLOR_GREY,
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                  ),
                                ),
                                Text(
                                  Strings.TODAY + Utils.dateFormatStyle2(),
                                  style: khulaRegular.copyWith(
                                    color: ColorResources.COLOR_GREY,
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                  ),
                                ),
                                Text(
                                  Strings.TIME_10_00_AM_TO_11_00_AM,
                                  style: khulaBold.copyWith(
                                    color: ColorResources.COLOR_PRIMARY,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: ColorResources.COLOR_GREY3,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Merry C will be contacting you shortly, please remember that you are not alone.We are with you",
                                    style: khulaSemiBold.copyWith(
                                      color: ColorResources.COLOR_GREY,
                                    ),
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //       "We are with you.",
                                  //       style: khulaSemiBold.copyWith(
                                  //         color: ColorResources.COLOR_GREY,
                                  //       ),
                                  //     ),
                                  //     Image.asset(
                                  //       'assets/doctor/images/splash_logo.png',
                                  //       height: 140,
                                  //       width: 140,
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: ColorResources.COLOR_GREY3,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "You will recieve a notification 5 min before your appointment, please be sure to have your phone charger with you and good internet connection.",
                                    style: khulaSemiBold.copyWith(
                                      color: ColorResources.COLOR_GREY,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 6,
                        ),
                        Center(
                          child: Text(
                            "Reference Number : 312X5",
                            style: khulaSemiBold.copyWith(
                              color: ColorResources.COLOR_GREY2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                            child: Text(
                              "Print your reciept \"here\"",
                              style: khulaSemiBold.copyWith(
                                color: ColorResources.COLOR_PRIMARY,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),

            Container(
              margin: EdgeInsets.all(15),
              child: CustomButton(
                btnTxt: "Contact Us",
                onTap: () {
                  pushNewScreen(
                    context,
                    screen: WriteAReviewScreen(),
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
