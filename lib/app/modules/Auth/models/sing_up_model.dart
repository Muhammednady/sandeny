class SingUpModel {
  Data? data;
  String? msg;
  int? code;

  SingUpModel({this.data, this.msg, this.code});

  SingUpModel.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  String? phone;
  int? iqamaNumber;
  String? token;

  Data(
      {this.firstName,
      this.lastName,
      this.phone,
      this.iqamaNumber,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    iqamaNumber = json['iqama_number'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['iqama_number'] = iqamaNumber;
    data['token'] = token;
    return data;
  }
}