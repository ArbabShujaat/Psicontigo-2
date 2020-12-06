import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/view/views/splash/spash_screen.dart';

class AllAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          SizedBox(height: 50),

          Container(
            height: 102,
            width: 102,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.orange, width: 2),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[350], spreadRadius: 2, blurRadius: 5)
              ],
              image: DecorationImage(
                  image: AssetImage('assets/logo.jpg'), fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: 50),

          AppButton(
            title: 'DocTree',
            description: 'A doctor consulting app',
            screens: 35,
            color: Color(0xff387AF6),
            widget: DoctorSplashScreen(),
          ),
          SizedBox(height: 20),

          // AppButton(
          //   title: 'Pixallet',
          //   description: 'A digital wallet app',
          //   screens: 25,
          //   color: Color(0xffA42AC3),
          //   widget: SplashScreenWallet(),
          // ),
          SizedBox(height: 20),

          // AppButton(
          //   title: 'Food Mama',
          //   description: 'A food ordering app',
          //   screens: 20,
          //   color: Color(0xff4DBF49),
          //   widget: SplashScreen(),
          // ),
        ]),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final String title;
  final String description;
  final int screens;
  final Color color;
  final Widget widget;
  AppButton({
    @required this.title,
    @required this.description,
    @required this.screens,
    @required this.color,
    @required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => widget)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(color: Colors.grey[300], spreadRadius: 1, blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Text(description,
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Text('$screens screens', style: TextStyle(fontSize: 10)),
            ),
          ),
        ]),
      ),
    );
  }
}
