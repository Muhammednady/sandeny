class AppointmentHistoryData {
  int? id;
  String? status;
  String? doctorName;
  int? doctorId;
  int? patientId;
  String? profileImage;
  Specializations? specializations;
  int? duration;
  String? sessionType;
  int? isPaid;
  String? date;
  String? startAt;
  String? endAt;
  String? price;
  String? type;

  AppointmentHistoryData(
      {this.id,
      this.status,
      this.doctorName,
      this.doctorId,
      this.patientId,
      this.profileImage,
      this.specializations,
      this.duration,
      this.sessionType,
      this.isPaid,
      this.date,
      this.startAt,
      this.endAt,
      this.price,
      this.type});

  AppointmentHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    doctorName = json['doctor_name'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    profileImage = json['profile_image'];
    specializations = json['specializations'] != null
        ? new Specializations.fromJson(json['specializations'])
        : null;
    duration = json['duration'];
    sessionType = json['session_type'];
    isPaid = json['is_paid'];
    date = json['date'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    price = json['price'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['doctor_name'] = this.doctorName;
    data['doctor_id'] = this.doctorId;
    data['patient_id'] = this.patientId;
    data['profile_image'] = this.profileImage;
    if (this.specializations != null) {
      data['specializations'] = this.specializations!.toJson();
    }
    data['duration'] = this.duration;
    data['session_type'] = this.sessionType;
    data['is_paid'] = this.isPaid;
    data['date'] = this.date;
    data['start_at'] = this.startAt;
    data['end_at'] = this.endAt;
    data['price'] = this.price;
    data['type'] = this.type;
    return data;
  }
}

class Specializations {
  int? id;
  String? ar;
  String? en;

  Specializations({this.id, this.ar, this.en});

  Specializations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ar'] = this.ar;
    data['en'] = this.en;
    return data;
  }
}
