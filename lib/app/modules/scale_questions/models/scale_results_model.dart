class ScaleResultModel {
  ScaleResultData? data;
  String? msg;
  int? code;

  ScaleResultModel({this.data, this.msg, this.code});

  ScaleResultModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ScaleResultData.fromJson(json['data']) : null;
    msg = json['msg'];
    code = json['code'];
  }

}

class ScaleResultData {
  Description? description;
  int? finalScore;
  int? result;

  ScaleResultData({this.description, this.finalScore, this.result});

  ScaleResultData.fromJson(Map<String, dynamic> json) {
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    finalScore = json['final_score'];
    result = json['result'];
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