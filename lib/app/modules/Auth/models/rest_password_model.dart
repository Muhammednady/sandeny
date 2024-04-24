class ResetPasswordModel {
  Data? data;
  String? msg;
  int? code;

  ResetPasswordModel({this.data, this.msg, this.code});

  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    msg = json['msg'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = msg;
    data['code'] = code;
    return data;
  }
}

class Data {
  int? id;
  String? email;
  int? emailVerifiedAt;
  String? username;
  String? phoneNumber;
  String? phoneOthers;
  String? firstName;
  String? lastName;
  String? birthOfDate;
  int? identificationNumber;
  int? availableStatus;
  String? address;
  String? gender;
  String? userType;
  int? isActive;
  int? isVerified;
  String? maritalStatus;
  String? iqamaNumber;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  int? countryId;
  int? cityId;
  String? fcmToken;

  Data(
      {this.id,
      this.email,
      this.emailVerifiedAt,
      this.username,
      this.phoneNumber,
      this.phoneOthers,
      this.firstName,
      this.lastName,
      this.birthOfDate,
      this.identificationNumber,
      this.availableStatus,
      this.address,
      this.gender,
      this.userType,
      this.isActive,
      this.isVerified,
      this.maritalStatus,
      this.iqamaNumber,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.countryId,
      this.cityId,
      this.fcmToken});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    username = json['username'];
    phoneNumber = json['phone_number'];
    phoneOthers = json['phone_others'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    birthOfDate = json['birth_of_date'];
    identificationNumber = json['identification_number'];
    availableStatus = json['available_status'];
    address = json['address'];
    gender = json['gender'];
    userType = json['user_type'];
    isActive = json['is_active'];
    isVerified = json['is_verified'];
    maritalStatus = json['marital_status'];
    iqamaNumber = json['iqama_number'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['username'] = username;
    data['phone_number'] = phoneNumber;
    data['phone_others'] = phoneOthers;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['birth_of_date'] = birthOfDate;
    data['identification_number'] = identificationNumber;
    data['available_status'] = availableStatus;
    data['address'] = address;
    data['gender'] = gender;
    data['user_type'] = userType;
    data['is_active'] = isActive;
    data['is_verified'] = isVerified;
    data['marital_status'] = maritalStatus;
    data['iqama_number'] = iqamaNumber;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['country_id'] = countryId;
    data['city_id'] = cityId;
    data['fcm_token'] = fcmToken;
    return data;
  }
}