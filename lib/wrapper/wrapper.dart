import 'package:flutter_ui_kit/screens/screen1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Screen1(),
      ),
    );
  }
}
