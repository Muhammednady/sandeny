class ForgetPasswordModel {
  int? code;
  String? message;
  Data? data;
  String? token;

  ForgetPasswordModel({this.code, this.message, this.data, this.token});

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class Data {
  int? id;
  String? fname;
  String? lname;
  String? username;
  String? iqama;
  String? phone;
  int? code;
  String? otherPhone;
  String? birthDate;
  String? gender;
  String? email;
  String? image;
  String? status;
  String? address;
  Patient? patient;
  int? isActive;
  List<Roles>? roles;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.fname,
      this.lname,
      this.username,
      this.iqama,
      this.phone,
      this.code,
      this.otherPhone,
      this.birthDate,
      this.gender,
      this.email,
      this.image,
      this.status,
      this.address,
      this.patient,
      this.isActive,
      this.roles,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    username = json['username'];
    iqama = json['iqama'];
    phone = json['phone'];
    code = json['code'];
    otherPhone = json['other_phone'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    email = json['email'];
    image = json['image'];
    status = json['status'];
    address = json['address'];
    patient =
        json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    isActive = json['is_active'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fname'] = fname;
    data['lname'] = lname;
    data['username'] = username;
    data['iqama'] = iqama;
    data['phone'] = phone;
    data['code'] = code;
    data['other_phone'] = otherPhone;
    data['birth_date'] = birthDate;
    data['gender'] = gender;
    data['email'] = email;
    data['image'] = image;
    data['status'] = status;
    data['address'] = address;
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    data['is_active'] = isActive;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Patient {
  int? id;
  String? patientNumber;
  String? maritalStatus;
  int? height;
  int? weight;
  String? familyMemberPhone;
  int? psychiatrist;
  String? psychiatristDescription;
  int? disability;
  String? disabilityDescription;
  int? healthProblem;
  String? healthProblemDescription;
  int? medication;
  String? medicationDescription;
  String? habits;
  String? habitsOtherDetails;
  int? diseases;
  String? diseasesOtherDetails;
  String? createdAt;
  String? updatedAt;

  Patient(
      {this.id,
      this.patientNumber,
      this.maritalStatus,
      this.height,
      this.weight,
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
      this.diseasesOtherDetails,
      this.createdAt,
      this.updatedAt});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientNumber = json['patient_number'];
    maritalStatus = json['marital_status'];
    height = json['height'];
    weight = json['weight'];
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patient_number'] = patientNumber;
    data['marital_status'] = maritalStatus;
    data['height'] = height;
    data['weight'] = weight;
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
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Roles {
  int? id;
  String? name;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Roles(
      {this.id,
      this.name,
      this.guardName,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['guard_name'] = guardName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? modelId;
  int? roleId;
  String? modelType;

  Pivot({this.modelId, this.roleId, this.modelType});

  Pivot.fromJson(Map<String, dynamic> json) {
    modelId = json['model_id'];
    roleId = json['role_id'];
    modelType = json['model_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['model_id'] = modelId;
    data['role_id'] = roleId;
    data['model_type'] = modelType;
    return data;
  }
}