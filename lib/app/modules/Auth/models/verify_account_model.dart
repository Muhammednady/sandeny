class VerifyAccountModel {
  Data? data;
  String? msg;
  int? code;

  VerifyAccountModel({this.data, this.msg, this.code});

  VerifyAccountModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    msg = json['msg'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = this.msg;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  int? id;
  String? email;
  String? emailVerifiedAt;
  String? username;
  String? phoneNumber;
  String? phoneOthers;
  String? firstName;
  String? lastName;
  String? birthOfDate;
  String? identificationNumber;
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
  String? countryId;
  String? cityId;
  String? fcmToken;
  String? height;
  String? weight;
  String? familyPhone;
  String? code;
  String? token;

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
      this.fcmToken,
      this.height,
      this.weight,
      this.familyPhone,
      this.code,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    email = json['email'] ?? '';
    emailVerifiedAt = json['email_verified_at'] ?? '';
    username = json['username'] ?? '';
    phoneNumber = json['phone_number'] ?? '';
    phoneOthers = json['phone_others'] ?? '';
    firstName = json['first_name'] ?? '';
    lastName = json['last_name'] ?? '';
    birthOfDate = json['birth_of_date'] ?? '';
    identificationNumber = json['identification_number'] ?? '';
    availableStatus = json['available_status'] ?? 0;
    address = json['address'] ?? '';
    gender = json['gender'] ?? '';
    userType = json['user_type'] ?? '';
    isActive = json['is_active'] ?? '';
    isVerified = json['is_verified'] ?? 0;
    maritalStatus = json['marital_status'] ?? '';
    iqamaNumber = json['iqama_number'] ?? '';
    deletedAt = json['deleted_at'] ?? '';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
    countryId = json['country_id'] ?? '';
    cityId = json['city_id'] ?? '';
    fcmToken = json['fcm_token'] ?? '';
    height = json['height'] ?? '';
    weight = json['weight'] ?? '';
    familyPhone = json['family_phone'] ?? '';
    code = json['code'] ?? '';
    token = json['token'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['username'] = this.username;
    data['phone_number'] = this.phoneNumber;
    data['phone_others'] = this.phoneOthers;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['birth_of_date'] = this.birthOfDate;
    data['identification_number'] = this.identificationNumber;
    data['available_status'] = this.availableStatus;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['user_type'] = this.userType;
    data['is_active'] = this.isActive;
    data['is_verified'] = this.isVerified;
    data['marital_status'] = this.maritalStatus;
    data['iqama_number'] = this.iqamaNumber;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    data['fcm_token'] = this.fcmToken;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['family_phone'] = this.familyPhone;
    data['code'] = this.code;
    data['token'] = this.token;
    return data;
  }
}
