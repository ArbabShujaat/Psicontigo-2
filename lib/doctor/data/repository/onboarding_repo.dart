import 'package:flutter_ui_kit/doctor/data/model/onboarding_model.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';

class OnBoardingRepo {
  List<OnBoardingModel> getOnboardingList = [
    OnBoardingModel(
      imageUrl:
          //'assets/doctor/Image/OB1.png'
          'assets/doctor/Image/NOB1.png',
      title:
          // Strings.THOUSANDS_OF_DOCTOR
          "",
      description: Strings.First_OB,
    ),
    OnBoardingModel(
      imageUrl:
          //'assets/doctor/Image/OB2.png'
          'assets/doctor/Image/NOB2.png',
      title:
          // Strings.LIVE_TALK
          "",
      description: Strings.Second_OB,
    ),
    OnBoardingModel(
      imageUrl:
          //'assets/doctor/Image/OB3.png'
          'assets/doctor/Image/NOB3.png',
      title:
          // Strings.GET_APPOINTMENT
          "",
      description: Strings.Third_OB,
    ),
    OnBoardingModel(
      imageUrl:
          //'assets/doctor/Image/OB2.png'
          'assets/doctor/Image/NOB4.png',
      title:
          //Strings.LIVE_TALK
          "",
      description: Strings.Fourth_OB,
    ),
  ];
}
