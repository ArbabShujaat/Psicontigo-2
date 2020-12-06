import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui_kit/doctor/data/model/doctor_data.dart';
import 'package:flutter_ui_kit/doctor/data/model/specialist_data.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/appointment_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/doctor_widget.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/home_specialist_cardwidget.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/home_specialist_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'about_doctor_screen.dart';
import 'doctor_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _homeToolbar(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Row(
        children: [
          Container(
            width: 37,
            height: 35,
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: ColorResources.COLOR_GAINSBORO,
              child: Icon(
                Icons.person,
                color: ColorResources.COLOR_WHITE,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Arbab Shujaat",
                  style: khulaRegular.copyWith(
                      color: ColorResources.COLOR_GREY, fontSize: 20),
                ),
                Text(
                  Strings.FIND_BEST_DOCTORS_EASILY,
                  style: khulaRegular.copyWith(
                      color: ColorResources.COLOR_GREY,
                      fontSize: Dimensions.FONT_SIZE_SMALL),
                ),
              ],
            ),
          ),
          Container(
              width: 38,
              height: 35,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ColorResources.COLOR_WHITE,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Image.asset(
                'assets/doctor/Icon/calendar3.png',
                color: ColorResources.COLOR_PRIMARY,
                fit: BoxFit.scaleDown,
              )),
        ],
      ),
    );
  }

  Widget _searchDoctors(BuildContext context) {
    return Container(
      height: 43,
      width: double.infinity,
      margin: EdgeInsets.only(right: 20, left: 20),
      padding: EdgeInsets.only(left: 20, right: 5),
      decoration: BoxDecoration(
        color: ColorResources.COLOR_WHITE,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 12,
            child: Text(
              Strings.SEARCH_HINT,
              style: khulaSemiBold.copyWith(
                color: ColorResources.COLOR_GAINSBORO,
              ),
            ),
          ),
          Positioned(
              right: 10,
              top: 10,
              child: Image.asset(
                'assets/doctor/Icon/Search.png',
                color: ColorResources.COLOR_PRIMARY,
                width: 25,
                height: 25,
              )),
        ],
      ),
    );
  }

  Widget _specialistList(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(color: ColorResources.COLOR_HOME_BACKGROUND),
      child: ListView.builder(
          itemCount: SpecialistData.speciaList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                pushNewScreen(
                  context,
                  screen: DoctorScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: HomeSpecialistWidget(SpecialistData.speciaList[index]),
            );
          }),
    );
  }

  Widget _showAllDoctor(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 10, bottom: 30),
        itemCount: DoctorData.allDoctorList.length,
        itemBuilder: (context, index) =>
            DoctorWidget(doctor: DoctorData.allDoctorList[index]));
  }

  Widget _specialistBannerList(BuildContext context) {
    return Container(
      height: 110,
      margin: EdgeInsets.only(left: 16),
      child: ListView.builder(
          itemCount: SpecialistData.getBannerList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                pushNewScreen(
                  context,
                  screen: AppointmentsScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child:
                  HomeSpecialistCardWidget(SpecialistData.getBannerList[index]),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _homeToolbar(context),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    pushNewScreen(
                      context,
                      screen: DoctorScreen(),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: _searchDoctors(context)),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Your Specialist",
                          style: khulaSemiBold.copyWith(
                              color: ColorResources.COLOR_PRIMARY,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.FONT_SIZE_OVER_LARGE),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "Because you are special to us, we want to give you a special attention with professionals in the are you need.",
                          style: khulaRegular.copyWith(
                              color: ColorResources.COLOR_GREY,
                              //fontWeight: FontWeight.bold,
                              fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                      ])),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("",
                          style: khulaSemiBold.copyWith(
                            color: ColorResources.COLOR_GREY,
                            fontSize: Dimensions.FONT_SIZE_LARGE,
                          )),
                      GestureDetector(
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: DoctorScreen(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Text(Strings.VIEW_ALL,
                            style: khulaSemiBold.copyWith(
                              color: ColorResources.COLOR_GREY,
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                            )),
                      ),
                    ],
                  )),
              Container(
                  height: MediaQuery.of(context).size.height / 1.6,
                  child: _showAllDoctor(context)),
            ],
          ),
        ),
      ),
    );
  }
}
