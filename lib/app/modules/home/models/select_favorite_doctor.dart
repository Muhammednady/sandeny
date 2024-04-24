class SelectFavoriteDoctor {
  int? code;
  String? message;
  Data? data;

  SelectFavoriteDoctor({this.code, this.message, this.data});

  SelectFavoriteDoctor.fromJson(Map<String, dynamic> json) {
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
  int? patientId;
  int? doctorId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.patientId, this.doctorId, this.updatedAt, this.createdAt, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    doctorId = json['doctor_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patient_id'] = patientId;
    data['doctor_id'] = doctorId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}