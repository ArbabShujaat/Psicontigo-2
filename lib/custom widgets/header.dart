import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 160,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage('images/logo.png'),
      //     fit: BoxFit.scaleDown,
      //   ),
      // ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(
          'images/logo.png',
          fit: BoxFit.scaleDown,
        ),
      ),
      // child: Container(
      //   color: Colors.black.withOpacity(0.3),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Flexible(
      //         child: Container(
      //           width: 155.75,
      //           height: 97,
      //           decoration: BoxDecoration(
      //             image: DecorationImage(
      //               image: AssetImage('images/logo.png'),
      //               fit: BoxFit.scaleDown,
      //             ),
      //           ),
      //         ),
      //       ),
      //       // Text('Logo',
      //       //     style: GoogleFonts.montserrat(
      //       //         textStyle: TextStyle(
      //       //             color: Colors.greenAccent,
      //       //             fontSize: 19.5,
      //       //             fontWeight: FontWeight.w500))),
      //       Text('Help us match you to the right counselor',
      //           textAlign: TextAlign.center,
      //           style: GoogleFonts.robotoSlab(
      //               textStyle: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 23.5,
      //                   fontWeight: FontWeight.w400))),
      //     ],
      //   ),
      // ),
    );
  }
}
