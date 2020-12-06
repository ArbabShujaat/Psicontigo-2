import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ui_kit/doctor/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_ui_kit/doctor/data/datasource/remote/dio/logging_interceptor.dart';
import 'package:flutter_ui_kit/doctor/data/repository/appointment_repo.dart';
import 'package:flutter_ui_kit/doctor/data/repository/auth_repo.dart';
import 'package:flutter_ui_kit/doctor/data/repository/onboarding_repo.dart';
import 'package:flutter_ui_kit/doctor/data/repository/profile_repo.dart';
import 'package:flutter_ui_kit/doctor/data/repository/chat_repo.dart';
import 'package:flutter_ui_kit/doctor/data/repository/contact_repo.dart';
import 'package:flutter_ui_kit/doctor/data/repository/faq_repo.dart';
import 'package:flutter_ui_kit/doctor/data/repository/membership_repo.dart';
import 'package:flutter_ui_kit/doctor/helper/network_info.dart';
import 'package:flutter_ui_kit/doctor/provider/appointment_provider.dart';
import 'package:flutter_ui_kit/doctor/provider/auth_provider.dart';
import 'package:flutter_ui_kit/doctor/provider/onboarding_provider.dart';
import 'package:flutter_ui_kit/doctor/provider/profile_provider.dart';
import 'package:flutter_ui_kit/doctor/provider/chat_provider.dart';
import 'package:flutter_ui_kit/doctor/provider/contact_provider.dart';
import 'package:flutter_ui_kit/doctor/provider/faq_provider.dart';
import 'package:flutter_ui_kit/doctor/utility/app_constants.dart';
import 'package:flutter_ui_kit/food/provider/home_provider.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'doctor/provider/membership_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(
      () => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl()));

  // Repository
  sl.registerLazySingleton(() => OnBoardingRepo());
  sl.registerLazySingleton(() => AuthRepo());
  sl.registerLazySingleton(() => ProfileRepo());
  sl.registerLazySingleton(() => MembershipRepo());
  sl.registerLazySingleton(() => ChatRepo());
  sl.registerLazySingleton(() => ContactRepo());
  sl.registerLazySingleton(() => FaqRepo());

  sl.registerLazySingleton(() => AppointmentRepo());

  // Provider
  sl.registerFactory(() => OnBoardingProvider(onBoardingRepo: sl()));
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  sl.registerFactory(() => ProfileProvider(profileRepo: sl()));
  sl.registerFactory(() => MembershipProvider(membershipRepo: sl()));
  sl.registerFactory(() => ChatProvider(chatRepo: sl()));
  sl.registerFactory(() => ContactProvider(contactRepo: sl()));
  sl.registerFactory(() => FaqProvider(faqRepo: sl()));

  sl.registerFactory(() => AppointmentProvider(appointmentRepo: sl()));
  sl.registerFactory(() => HomeProvider());

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
