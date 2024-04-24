class ScaleDetailsModel {
  ScaleDetailsData? data;
  String? msg;
  int? code;

  ScaleDetailsModel({this.data, this.msg, this.code});

  ScaleDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ScaleDetailsData.fromJson(json['data']) : null;
    msg = json['msg'];
    code = json['code'];
  }

}

class ScaleDetailsData {
  int? id;
  Name? name;
  String? image;
  int? questionCount;
  Name? introduction;
  Name? description;
  List<Questions>? questions;

  ScaleDetailsData(
      {this.id,
      this.name,
      this.image,
      this.questionCount,
      this.introduction,
      this.description,
      this.questions});

  ScaleDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    image = json['image'];
    questionCount = json['question_count'];
    introduction = json['introduction'] != null
        ? Name.fromJson(json['introduction'])
        : null;
    description = json['description'] != null
        ? Name.fromJson(json['description'])
        : null;
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
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

class Questions {
  int? currentQuestion;
  int? id;
  Name? name;
  List<Answers>? answers;

  Questions({this.currentQuestion, this.id, this.name, this.answers});

  Questions.fromJson(Map<String, dynamic> json) {
    currentQuestion = json['current_question'];
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
  }

}

class Answers {
  int? isCorrect;
  Name? name;
  int? id;

  Answers({this.isCorrect, this.name});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isCorrect = json['is_correct'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

}