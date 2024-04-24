class Logout {
  int? code;
  String? message;
  dynamic data;

  Logout({this.code, this.message, this.data});

  Logout.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    data['data'] = data;
    return data;
  }
}
