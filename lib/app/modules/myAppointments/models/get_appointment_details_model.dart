class GetAppointmentDetails {
  List<AppointmentDetails>? data;
  String? msg;
  int? code;

  GetAppointmentDetails({this.data, this.msg, this.code});

  GetAppointmentDetails.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AppointmentDetails>[];
      json['data'].forEach((v) {
        data!.add(AppointmentDetails.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }
}

class AppointmentDetails {
  int? id;
  int? patientId;
  int? doctorId;
  int? isPaid;
  String? status;
  String? doctorName;
  String? profileImage;
  Specializations? specializations;
  int? duration;
  String? date;
  String? type;
  String? price;
  String? patientName;
  String? problem;
  List<Attchments>? attachments;

  AppointmentDetails(
      {this.id,
      this.patientId,
      this.doctorId,
      this.isPaid,
      this.status,
      this.doctorName,
      this.profileImage,
      this.specializations,
      this.duration,
      this.date,
      this.type,
      this.price,
      this.patientName,
      this.problem,
      this.attachments});

  AppointmentDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    doctorId = json['doctor_id'];
    isPaid = json['is_paid'];
    status = json['status'];
    doctorName = json['doctor_name'];
    profileImage = json['profile_image'];
    specializations = json['specializations'] != null
        ? Specializations.fromJson(json['specializations'])
        : null;
    duration = json['duration'];
    date = json['date'];
    type = json['type'];
    price = json['price'];
    patientName = json['patient_name'];
    problem = json['problem'];
    if (json['attachments'] != null) {
      attachments = <Attchments>[];
      json['attachments'].forEach((v) {
        attachments!.add(Attchments.fromJson(v));
      });
    }
  }
}

class Specializations {
  String? ar;
  String? en;

  Specializations({this.ar, this.en});

  Specializations.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ar'] = ar;
    data['en'] = en;
    return data;
  }
}

class Attchments {
  String? file;
  Attchments({this.file});
  Attchments.fromJson(Map<String, dynamic> json) {
    file = json['file'] ?? '';
  }
}
