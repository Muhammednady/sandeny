class SendBilateralSessionDetailsModel {
  AppointmentData? data;
  String? msg;
  int? code;

  SendBilateralSessionDetailsModel({this.data, this.msg, this.code});

  SendBilateralSessionDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? AppointmentData.fromJson(json['data']) : null;
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

class AppointmentData {
  int? appointmentId;

  AppointmentData({this.appointmentId});

  AppointmentData.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointment_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointment_id'] = appointmentId;
    return data;
  }
}