import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/startup_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/custom_app_bar.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/edittext/custom_text_field.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/textfield_title_widget.dart';

class ProfileEditScreen extends StatefulWidget {
  final fromSetting;
  ProfileEditScreen({@required this.fromSetting});

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  bool isMale = true;
  TextEditingController _dateofbirthController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  FocusNode _dateNode = FocusNode();
  FocusNode _locationNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Column(
          children: [
            widget.fromSetting ? CustomAppBar(title: '') : SizedBox.shrink(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                children: [
                  Text(
                    Strings.SET_UP_YOUR_PROFILE,
                    style: khulaSemiBold.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        color: ColorResources.COLOR_GREY),
                  ),
                  Text(
                    Strings.UPDATE_YOUR_PROFILE,
                    style: khulaSemiBold.copyWith(
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                        color: ColorResources.COLOR_GREY),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorResources.COLOR_GAINSBORO,
                              borderRadius: BorderRadius.circular(24)),
                          child: Icon(Icons.person,
                              color: ColorResources.COLOR_WHITE, size: 75),
                        ),
                        Positioned(
                          bottom: -22,
                          left: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: ColorResources.COLOR_PRIMARY,
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: Image.asset(
                                    'assets/doctor/Icon/camera.png')),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 50),

                  // // check mail or female
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     TextFieldTitleWidget(
                  //       imageUrl: 'assets/doctor/Icon/gendeer.png',
                  //       title: Strings.GENDER,
                  //     ),
                  //     SizedBox(
                  //       height: 10,
                  //     ),
                  //     Row(
                  //       children: [
                  //         Expanded(
                  //           child: GestureDetector(
                  //             onTap: () {
                  //               setState(() {
                  //                 isMale = true;
                  //               });
                  //             },
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               children: [
                  //                 isMale
                  //                     ? CircleAvatar(
                  //                   radius: 12,
                  //                   backgroundColor: ColorResources.COLOR_PRIMARY,
                  //                   child: Icon(
                  //                     Icons.done,
                  //                     color: ColorResources.COLOR_WHITE,
                  //                     size: 15,
                  //                   ),
                  //                 )
                  //                     : CircleAvatar(
                  //                   radius: 12,
                  //                   backgroundColor: ColorResources.COLOR_GAINSBORO,
                  //                 ),
                  //                 SizedBox(
                  //                   width: 10,
                  //                 ),
                  //                 Container(
                  //                   margin: EdgeInsets.only(top: 2),
                  //                   child: Text(
                  //                     Strings.MALE,
                  //                     style: khulaSemiBold.copyWith(
                  //                         color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_SMALL),
                  //                   ),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         Expanded(
                  //           flex: 2,
                  //           child: GestureDetector(
                  //             onTap: () {
                  //               setState(() {
                  //                 isMale = false;
                  //               });
                  //             },
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               children: [
                  //                 !isMale
                  //                     ? CircleAvatar(
                  //                   radius: 12,
                  //                   backgroundColor: ColorResources.COLOR_PRIMARY,
                  //                   child: Icon(
                  //                     Icons.done,
                  //                     color: ColorResources.COLOR_WHITE,
                  //                     size: 15,
                  //                   ),
                  //                 )
                  //                     : CircleAvatar(
                  //                   radius: 12,
                  //                   backgroundColor: ColorResources.COLOR_GAINSBORO,
                  //                 ),
                  //                 SizedBox(
                  //                   width: 10,
                  //                 ),
                  //                 Container(
                  //                   margin: EdgeInsets.only(top: 2),
                  //                   child: Text(
                  //                     Strings.FEMALE,
                  //                     style: khulaSemiBold.copyWith(
                  //                         color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_SMALL),
                  //                   ),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // for Date of Birth
                  Container(
                    margin: EdgeInsets.only(
                      top: Dimensions.MARGIN_SIZE_DEFAULT,
                    ),
                    child: Stack(
                      children: [
                        TextFieldTitleWidget(
                          imageUrl: 'assets/doctor/Icon/calendar3.png',
                          title: Strings.DATE_OF_BIRTH,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: Dimensions.MARGIN_SIZE_LARGE),
                          child: CustomTextField(
                            hintTxt: Strings.ENTER_YOUR_DATE_OF_BIRTH,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            focusNode: _dateNode,
                            nextNode: _locationNode,
                            controller: _dateofbirthController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // for Location
                  Container(
                    margin: EdgeInsets.only(
                      top: Dimensions.MARGIN_SIZE_DEFAULT,
                    ),
                    child: Stack(
                      children: [
                        TextFieldTitleWidget(
                          imageUrl: 'assets/doctor/Icon/location.png',
                          title: Strings.LOCATION,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: Dimensions.MARGIN_SIZE_LARGE),
                          child: CustomTextField(
                            hintTxt: Strings.ENTER_YOUR_LOCATION,
                            textInputType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.done,
                            focusNode: _locationNode,
                            controller: _locationController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: CustomButton(
                btnTxt: widget.fromSetting ? Strings.SAVE : Strings.CONTINUE,
                onTap: () {
                  widget.fromSetting
                      ? Navigator.of(context).pop()
                      : Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => StartupScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
