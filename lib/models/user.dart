class User {
  String gender;
  String orientation;
  String status;
  String religiousStatus;
  String religion;
  String religiousCounseling;
  String spiritual;
  String therapy;
  String denomination;
  String impacted;
  String spiritualBackground;
  String prayerStatus;
  String natureCounseling;
  String suicide;
  String medicalCondition;
  String medication;
  String financialStatus;
  String sleepingStatus;
  String methodCommunication;
  var age;
  String selectedCountry;
  String selectedLanguage;

  getGender(String value) {
    gender = value;
  }

  getOrientation(String val) => orientation = val;
  getStatus(String val) => status = val;
  getReligiousStatus(String val) => religiousStatus = val;
  getReligion(String val) => religion = val;
  getReligiousCounselor(String val) => religiousCounseling = val;
  getSpiritual(String val) => spiritual = val;
  getTherapy(String val) => therapy = val;
  getDenomination(String val) => denomination = val;
  getImpacted(String val) => impacted = val;
  getBackground(String val) => spiritualBackground = val;
  getPrayerStatus(String val) => prayerStatus = val;
  getNatureCounseling(String val) => natureCounseling = val;
  getSuicide(String val) => suicide = val;
  getMedicalCondition(String val) => medicalCondition = val;
  getMedication(String val) => medication = val;
  getFinancialStatus(String val) => financialStatus = val;
  getSleepingStatus(String val) => sleepingStatus = val;
  getMethodCommunication(String val) => methodCommunication = val;
  getAge(var val) => age = val;
  getCountry(var val) => selectedCountry = val;
  getLanguage(var val) => selectedLanguage = val;
}
