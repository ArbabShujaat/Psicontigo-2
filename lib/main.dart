import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';
import 'package:flutter_ui_kit/doctor/provider/auth_provider.dart';
import 'package:flutter_ui_kit/doctor/provider/onboarding_provider.dart';
import 'package:flutter_ui_kit/doctor/provider/profile_provider.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/provider/home_provider.dart';

import 'package:flutter_ui_kit/food/utility/route.dart';

import 'package:provider/provider.dart';
import 'di_container.dart' as di;
import 'doctor/provider/appointment_provider.dart';
import 'doctor/provider/chat_provider.dart';
import 'doctor/provider/contact_provider.dart';
import 'doctor/provider/faq_provider.dart';
import 'doctor/provider/membership_provider.dart';
import 'doctor/view/views/splash/spash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<OnBoardingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ProfileProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<MembershipProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ChatProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ContactProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<FaqProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AppointmentProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<HomeProvider>()),
    ],
    child: FlutterUIKit(),
  ));
}

var routes = <String, WidgetBuilder>{
  ScreenRoute.ALL_SCREEN: (BuildContext context) => DoctorSplashScreen()
};

class FlutterUIKit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '6am UI Kit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Muli',
        primaryColor: ColorResources.COLOR_WHITE,
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
      ),
      routes: routes,
      initialRoute: ScreenRoute.ALL_SCREEN,
    );
  }
}
