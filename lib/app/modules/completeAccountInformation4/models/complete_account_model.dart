class CompleteUserAccountModel {
  String? email;
  String? otherPhone;
  int? weight;
  int? height;
  String? birthDate;
  String? gender;
  String? maritalStatus;
  String? familyMemberPhone;
  int? psychiatrist;
  String? psychiatristDescription;
  int? disability;
  String? disabilityDescription;
  int? healthProblem;
  String? healthProblemDescription;
  int? medication;
  String? medicationDescription;
  List<String>? habits;
  String? habitsOtherDetails;
  int? diseases;
  String? diseasesOtherDetails;

  CompleteUserAccountModel(
      {this.email,
      this.otherPhone,
      this.weight,
      this.height,
      this.birthDate,
      this.gender,
      this.maritalStatus,
      this.familyMemberPhone,
      this.psychiatrist,
      this.psychiatristDescription,
      this.disability,
      this.disabilityDescription,
      this.healthProblem,
      this.healthProblemDescription,
      this.medication,
      this.medicationDescription,
      this.habits,
      this.habitsOtherDetails,
      this.diseases,
      this.diseasesOtherDetails});

  CompleteUserAccountModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    otherPhone = json['other_phone'];
    weight = json['weight'];
    height = json['height'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    maritalStatus = json['marital_status'];
    familyMemberPhone = json['family_member_phone'];
    psychiatrist = json['psychiatrist'];
    psychiatristDescription = json['psychiatrist_description'];
    disability = json['disability'];
    disabilityDescription = json['disability_description'];
    healthProblem = json['health_problem'];
    healthProblemDescription = json['health_problem_description'];
    medication = json['medication'];
    medicationDescription = json['medication_description'];
    habits = json['habits'];
    habitsOtherDetails = json['habits_other_details'];
    diseases = json['diseases'];
    diseasesOtherDetails = json['diseases_other_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['other_phone'] = otherPhone;
    data['weight'] = weight;
    data['height'] = height;
    data['birth_date'] = birthDate;
    data['gender'] = gender;
    data['marital_status'] = maritalStatus;
    data['family_member_phone'] = familyMemberPhone;
    data['psychiatrist'] = psychiatrist;
    data['psychiatrist_description'] = psychiatristDescription;
    data['disability'] = disability;
    data['disability_description'] = disabilityDescription;
    data['health_problem'] = healthProblem;
    data['health_problem_description'] = healthProblemDescription;
    data['medication'] = medication;
    data['medication_description'] = medicationDescription;
    data['habits'] = habits;
    data['habits_other_details'] = habitsOtherDetails;
    data['diseases'] = diseases;
    data['diseases_other_details'] = diseasesOtherDetails;
    return data;
  }
}