class SendImmediateConsultation {
  Data? data;
  String? msg;
  int? code;

  SendImmediateConsultation({this.data, this.msg, this.code});

  SendImmediateConsultation.fromJson(Map<String, dynamic> json) {
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
  String? waitingTime;

  Data({this.appointmentId, this.waitingTime});

  Data.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointment_id'];
    waitingTime = json['waiting time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointment_id'] = appointmentId;
    data['waiting time'] = waitingTime;
    return data;
  }
}