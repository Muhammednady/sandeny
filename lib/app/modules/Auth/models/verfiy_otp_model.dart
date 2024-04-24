class VerifyOtpModel {
  int? code;
  String? message;
  Data? data;

  VerifyOtpModel({this.code, this.message, this.data});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
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
  String? otherPhone;
  String? birthDate;
  String? gender;
  String? email;
  int? emailVerifiedAt;
  String? image;
  String? address;
  String? userType;
  int? isActive;
  String? code;
  String? fcmToken;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.fname,
      this.lname,
      this.username,
      this.iqama,
      this.phone,
      this.otherPhone,
      this.birthDate,
      this.gender,
      this.email,
      this.emailVerifiedAt,
      this.image,
      this.address,
      this.userType,
      this.isActive,
      this.code,
      this.fcmToken,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    username = json['username'];
    iqama = json['iqama'];
    phone = json['phone'];
    otherPhone = json['other_phone'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    // image = json['image'];
    address = json['address'];
    userType = json['user_type'];
    isActive = json['is_active'];
    code = json['code'];
    fcmToken = json['fcm_token'];
    deletedAt = json['deleted_at'];
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
    data['other_phone'] = otherPhone;
    data['birth_date'] = birthDate;
    data['gender'] = gender;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['image'] = image;
    data['address'] = address;
    data['user_type'] = userType;
    data['is_active'] = isActive;
    data['code'] = code;
    data['fcm_token'] = fcmToken;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}