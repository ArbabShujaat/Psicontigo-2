import 'package:flutter_ui_kit/doctor/data/model/appointment_model.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';

class AppointmentRepo {
  List<AppointmentModel> getAppointmentList() {
    List<AppointmentModel> appointmentList = [
      AppointmentModel('assets/doctor/images/doctor1.jpg', Strings.DOCTOR_NAME1, 'Messaging', '10:30-11:00 AM', true),
      AppointmentModel('assets/doctor/images/doctor2.jpg', Strings.DOCTOR_NAME2, 'Voice Call', '10:30-11:00 AM', false),
      AppointmentModel('assets/doctor/images/doctor3.jpg', Strings.DOCTOR_NAME3, 'Video Call', '10:30-11:00 AM', true),
      AppointmentModel('assets/doctor/images/doctor1.jpg', Strings.DOCTOR_NAME1, 'Messaging', '10:30-11:00 AM', true),
      AppointmentModel('assets/doctor/images/doctor2.jpg', Strings.DOCTOR_NAME2, 'Voice Call', '10:30-11:00 AM', false),
      AppointmentModel('assets/doctor/images/doctor3.jpg', Strings.DOCTOR_NAME3, 'Video Call', '10:30-11:00 AM', true),
      AppointmentModel('assets/doctor/images/doctor1.jpg', Strings.DOCTOR_NAME1, 'Messaging', '10:30-11:00 AM', true),
      AppointmentModel('assets/doctor/images/doctor2.jpg', Strings.DOCTOR_NAME2, 'Voice Call', '10:30-11:00 AM', false),
      AppointmentModel('assets/doctor/images/doctor3.jpg', Strings.DOCTOR_NAME3, 'Video Call', '10:30-11:00 AM', true),
      AppointmentModel('assets/doctor/images/doctor1.jpg', Strings.DOCTOR_NAME1, 'Messaging', '10:30-11:00 AM', true),
      AppointmentModel('assets/doctor/images/doctor2.jpg', Strings.DOCTOR_NAME2, 'Voice Call', '10:30-11:00 AM', false),
      AppointmentModel('assets/doctor/images/doctor3.jpg', Strings.DOCTOR_NAME3, 'Video Call', '10:30-11:00 AM', true),
      AppointmentModel('assets/doctor/images/doctor1.jpg', Strings.DOCTOR_NAME1, 'Messaging', '10:30-11:00 AM', true),
      AppointmentModel('assets/doctor/images/doctor2.jpg', Strings.DOCTOR_NAME2, 'Voice Call', '10:30-11:00 AM', false),
      AppointmentModel('assets/doctor/images/doctor3.jpg', Strings.DOCTOR_NAME3, 'Video Call', '10:30-11:00 AM', true),
    ];
    return appointmentList;
  }
}