class SpecializationsModel {
  List<SpecificationData>? data;
  String? msg;
  int? code;

  SpecializationsModel({this.data, this.msg, this.code});

  SpecializationsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SpecificationData>[];
      json['data'].forEach((v) {
        data!.add(SpecificationData.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }

}

class SpecificationData {
  int? id;
  Name? name;
  Name? description;

  SpecificationData({this.id, this.name, this.description});

  SpecificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    description = json['description'] != null
        ? Name.fromJson(json['description'])
        : null;
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
}