class ScaleModel {
  List<ScaleData>? data;
  String? msg;
  int? code;

  ScaleModel({this.data, this.msg, this.code});

  ScaleModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ScaleData>[];
      json['data'].forEach((v) {
        data!.add(ScaleData.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }

}

class ScaleData {
  int? id;
  Name? name;
  String? image;
  int? questionCount;

  ScaleData({this.id, this.name, this.image, this.questionCount});

  ScaleData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    image = json['image'];
    questionCount = json['question_count'];
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