class CompleteProfileModel {
  Data? data;
  String? msg;
  int? code;

  CompleteProfileModel({this.data, this.msg, this.code});

  CompleteProfileModel.fromJson(Map<String, dynamic> json) {
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
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    iqamaNumber = json['iqama_number'];
    email = json['email'];
    dOB = json['DOB'];
    phoneOthers = json['phone_others'];
    familyPhone = json['family_phone'];
    height = json['height'];
    weight = json['weight'];
    maritalStatus = json['marital_status'];
    gender = json['gender'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['iqama_number'] = this.iqamaNumber;
    data['email'] = this.email;
    data['DOB'] = this.dOB;
    data['phone_others'] = this.phoneOthers;
    data['family_phone'] = this.familyPhone;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['marital_status'] = this.maritalStatus;
    data['gender'] = this.gender;
    data['profile_image'] = this.profileImage;
    return data;
  }
}

// class CompleteProfileModel {
//   Data? data;
//   String? msg;
//   int? code;

//   CompleteProfileModel({this.data, this.msg, this.code});

//   CompleteProfileModel.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//     msg = json['msg'];
//     code = json['code'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['msg'] = msg;
//     data['code'] = code;
//     return data;
//   }
// }

// class Data {
//   String? firstName;
//   String? lastName;
//   String? phone;
//   String? iqamaNumber;
//   String? email;
//   String? dOB;
//   String? phoneOthers;
//   String? height;
//   String? weight;
//   String? maritalStatus;
//   String? gender;
//   String? profileImage;

//   Data(
//       {this.firstName,
//       this.lastName,
//       this.phone,
//       this.iqamaNumber,
//       this.email,
//       this.dOB,
//       this.phoneOthers,
//       this.height,
//       this.weight,
//       this.maritalStatus,
//       this.gender,
//       this.profileImage});

//   Data.fromJson(Map<String, dynamic> json) {
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     phone = json['phone'];
//     iqamaNumber = json['iqama_number'];
//     email = json['email'];
//     dOB = json['DOB'];
//     phoneOthers = json['phone_others'];
//     height = json['height'];
//     weight = json['weight'];
//     maritalStatus = json['marital_status'];
//     gender = json['gender'];
//     profileImage = json['profile_image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['first_name'] = firstName;
//     data['last_name'] = lastName;
//     data['phone'] = phone;
//     data['iqama_number'] = iqamaNumber;
//     data['email'] = email;
//     data['DOB'] = dOB;
//     data['phone_others'] = phoneOthers;
//     data['height'] = height;
//     data['weight'] = weight;
//     data['marital_status'] = maritalStatus;
//     data['gender'] = gender;
//     data['profile_image'] = profileImage;
//     return data;
//   }
// }