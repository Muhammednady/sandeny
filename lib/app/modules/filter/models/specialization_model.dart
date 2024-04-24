class SpecializationModel {
  List<SpecializationData>? data;
  String? msg;
  int? code;

  SpecializationModel({this.data, this.msg, this.code});

  SpecializationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SpecializationData>[];
      json['data'].forEach((v) {
        data!.add(SpecializationData.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }
}

class SpecializationData {
  int? id;
  Name? name;
  Name? description;

  SpecializationData({this.id, this.name, this.description});

  SpecializationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    description = json['description'] != null
        ? Name.fromJson(json['description'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    return data;
  }
}

class Name {
  String? ar;
  String? en;

  Name({this.ar, this.en});

  Name.fromJson(Map<String, dynamic> json) {
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