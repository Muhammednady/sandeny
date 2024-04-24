class ExperienceYearsModel {
  List<ExperienceData>? data;
  String? msg;
  int? code;

  ExperienceYearsModel({this.data, this.msg, this.code});

  ExperienceYearsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ExperienceData>[];
      json['data'].forEach((v) {
        data!.add(ExperienceData.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    data['code'] = code;
    return data;
  }
}

class ExperienceData {
  int? id;
  String? fromTo;

  ExperienceData({this.id, this.fromTo});

  ExperienceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromTo = json['from_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['from_to'] = fromTo;
    return data;
  }
}