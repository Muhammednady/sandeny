class ChangePasswordModel {
  int? code;
  String? message;

  ChangePasswordModel({this.code, this.message});

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}