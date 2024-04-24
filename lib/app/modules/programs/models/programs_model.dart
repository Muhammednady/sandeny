class ProgramsModel {
  List<ProgramData>? data;
  String? msg;
  int? code;

  ProgramsModel({this.data, this.msg, this.code});

  ProgramsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProgramData>[];
      json['data'].forEach((v) {
        data!.add(ProgramData.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }

}

class ProgramData {
  int? id;
  Title? title;
  int? stagesCount;
  String? image;

  ProgramData({this.title, this.stagesCount, this.image});

  ProgramData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    stagesCount = json['stages_count'];
    image = json['image'];
  }

}

class Title {
  String? ar;
  String? en;

  Title({this.ar, this.en});

  Title.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

}