class ProfileModel {
  Data? data;
  String? msg;
  int? code;

  ProfileModel({this.data, this.msg, this.code});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    msg = json['msg'];
    code = json['code'];
  }

}

class Data {
  String? firstName;
  String? lastName;
  String? phone;
  String? iqamaNumber;
  String? email;
  String? dOB;
  String? phoneOthers;
  String? familyPhone;
  String? height;
  String? weight;
  String? maritalStatus;
  String? gender;
  String? profileImage;

  Data(
      {this.firstName,
      this.lastName,
      this.phone,
      this.iqamaNumber,
      this.email,
      this.dOB,
      this.phoneOthers,
      this.familyPhone,
      this.height,
      this.weight,
      this.maritalStatus,
      this.gender,
      this.profileImage});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'] ?? '';
    lastName = json['last_name'] ?? '';
    phone = json['phone'] ?? '';
    iqamaNumber = json['iqama_number'] ?? '';
    email = json['email'] ?? '';
    dOB = json['DOB'] ?? '';
    phoneOthers = json['phone_others'] ?? '';
    familyPhone = json['family_phone'] ?? '';
    height = json['height'] ?? '';
    weight = json['weight'] ?? '';
    maritalStatus = json['marital_status'] ?? '';
    gender = json['gender'] ?? '';
    profileImage = json['profile_image'] ?? '';
  }
}