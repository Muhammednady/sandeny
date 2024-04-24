
class GetDoctorsModel {
  List<ResultData>? data;
  String? msg;
  int? code;

  GetDoctorsModel({this.data, this.msg, this.code});

  GetDoctorsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ResultData>[];
      json['data'].forEach((v) {
        data!.add(ResultData.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }
}

class ResultData {
  int? id;
  String? name;
  String? rateAvg;
  Description? description;
  String? profileImage;
  List<Specializations>? specializations;

  ResultData(
      {this.id,
      this.name,
      this.rateAvg,
      this.description,
      this.profileImage,
      this.specializations});

  ResultData.fromJson(Map<String, dynamic> json) {
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
