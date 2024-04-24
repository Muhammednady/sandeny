
class AvailableAppointmentModel {
  List<AvailableAppointmentData>? data;
  String? msg;
  int? code;

  AvailableAppointmentModel({this.data, this.msg, this.code});

  AvailableAppointmentModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AvailableAppointmentData>[];
      json['data'].forEach((v) {
        data!.add(AvailableAppointmentData.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }
}

class AvailableAppointmentData {
  String? startAt;
  String? endAt;

  AvailableAppointmentData({this.startAt, this.endAt});

  AvailableAppointmentData.fromJson(Map<String, dynamic> json) {
    startAt = json['start_at'];
    endAt = json['end_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start_at'] = startAt;
    data['end_at'] = endAt;
    return data;
  }
}
