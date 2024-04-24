class GetAppointmentDetails {
  List<AppointmentData>? data;

  GetAppointmentDetails({this.data});

  GetAppointmentDetails.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AppointmentData>[];
      json['data'].forEach((v) {
        data!.add(AppointmentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppointmentData {
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
  String? price;
  String? type;

  AppointmentData(
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
      this.price,
      this.type});

  AppointmentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    doctorName = json['doctor_name'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    profileImage = json['profile_image'];
    specializations = json['specializations'] != null
        ? Specializations.fromJson(json['specializations'])
        : null;
    duration = json['duration'];
    sessionType = json['session_type'];
    isPaid = json['is_paid'];
    date = json['date'];
    price = json['price'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['doctor_name'] = doctorName;
    data['doctor_id'] = doctorId;
    data['patient_id'] = patientId;
    data['profile_image'] = profileImage;
    if (specializations != null) {
      data['specializations'] = specializations!.toJson();
    }
    data['duration'] = duration;
    data['session_type'] = sessionType;
    data['is_paid'] = isPaid;
    data['date'] = date;
    data['price'] = price;
    data['type'] = type;
    return data;
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



// class GetAppointmentDetails {
//   List<AppointmentData>? data;
//   String? msg;
//   int? code;

//   GetAppointmentDetails({this.data, this.msg, this.code});

//   GetAppointmentDetails.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <AppointmentData>[];
//       json['data'].forEach((v) {
//         data!.add(AppointmentData.fromJson(v));
//       });
//     }
//     msg = json['msg'];
//     code = json['code'];
//   }

// }

// class AppointmentData {
//   int? id;
//   String? status;
//   String? doctorName;
//   int? doctorId;
//   int? patientId;
//   String? profileImage;
//   Specializations? specializations;
//   int? duration;
//   int? isPaid;
//   String? date;
//   int? price;
//   String? type;

//   AppointmentData(
//       {this.id,
//       this.status,
//       this.doctorName,
//       this.doctorId,
//       this.patientId,
//       this.profileImage,
//       this.specializations,
//       this.duration,
//       this.isPaid,
//       this.date,
//       this.price,
//       this.type});

//   AppointmentData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     status = json['status'];
//     doctorName = json['doctor_name'];
//     doctorId = json['doctor_id'];
//     patientId = json['patient_id'];
//     profileImage = json['profile_image'];
//     specializations = json['specializations'] != null
//         ? Specializations.fromJson(json['specializations'])
//         : null;
//     duration = json['duration'];
//     isPaid = json['is_paid'];
//     date = json['date'];
//     price = json['price'].toInt();
//     type = json['type'];
//   }

// }

// class Specializations {
//   String? ar;
//   String? en;

//   Specializations({this.ar, this.en});

//   Specializations.fromJson(Map<String, dynamic> json) {
//     ar = json['ar'];
//     en = json['en'];
//   }

// }
