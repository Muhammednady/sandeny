class GetAvailableScheduledSessionDoctor {
  List<ScheduledSessionDoctors>? data;
  String? msg;
  int? code;

  GetAvailableScheduledSessionDoctor({this.data, this.msg, this.code});

  GetAvailableScheduledSessionDoctor.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ScheduledSessionDoctors>[];
      json['data'].forEach((v) {
        data!.add(ScheduledSessionDoctors.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }

}

class ScheduledSessionDoctors {
  int? id;
  String? name;
  String? rateAvg;
  Description? description;
  String? profileImage;
  List<Specializations>? specializations;
  List<WorkDays>? workDays;

  ScheduledSessionDoctors(
      {this.id,
      this.name,
      this.rateAvg,
      this.description,
      this.profileImage,
      this.specializations,
      this.workDays});

  ScheduledSessionDoctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rateAvg = json['rate_avg'];
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    profileImage = json['profile_image'];
    if (json['specializations'] != null) {
      specializations = <Specializations>[];
      json['specializations'].forEach((v) {
        specializations!.add(Specializations.fromJson(v));
      });
    }
    if (json['work_days'] != null) {
      workDays = <WorkDays>[];
      json['work_days'].forEach((v) {
        workDays!.add(WorkDays.fromJson(v));
      });
    }
  }

}

class Description {
  String? ar;
  String? en;

  Description({this.ar, this.en});

  Description.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

}

class Specializations {
  Name? name;

  Specializations({this.name});

  Specializations.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }
}

class Name {
  int? id;
  String? ar;
  String? en;

  Name({this.id, this.ar, this.en});

  Name.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ar = json['ar'];
    en = json['en'];
  }

}

class WorkDays {
  int? id;
  String? day;
  String? from;
  String? to;

  WorkDays({this.id, this.day, this.from, this.to});

  WorkDays.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    from = json['from'];
    to = json['to'];
  }

}
