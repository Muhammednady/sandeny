class SaveScheduledSessionModel {
  Data? data;
  String? msg;
  int? code;

  SaveScheduledSessionModel({this.data, this.msg, this.code});

  SaveScheduledSessionModel.fromJson(Map<String, dynamic> json) {
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
  int? appointmentId;

  Data({this.appointmentId});

  Data.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointment_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointment_id'] = appointmentId;
    return data;
  }
}