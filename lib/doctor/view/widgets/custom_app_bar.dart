import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  CustomAppBar({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Text(title, style: khulaSemiBold.copyWith(fontSize: 16, color: ColorResources.COLOR_GREY)),
              )),
        ],
      ),
    );
  }
}
