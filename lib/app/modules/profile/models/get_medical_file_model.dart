class GetMedicalFileModel {
  List<MedicalQuestionData>? data;
  String? msg;
  int? code;

  GetMedicalFileModel({this.data, this.msg, this.code});

  GetMedicalFileModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MedicalQuestionData>[];
      json['data'].forEach((v) {
        data!.add(MedicalQuestionData.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }

}

class MedicalQuestionData {
  int? id;
  int? isMultiple;
  Question? question;
  AnotherQuestion? anotherQuestion;
  List<AnswerQuestion>? answersList;

  MedicalQuestionData(
      {this.id,
      this.isMultiple,
      this.question,
      this.anotherQuestion,
      this.answersList,
      });

  MedicalQuestionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isMultiple = json['is_multiple'];
    question = json['question'] != null
        ? Question.fromJson(json['question'])
        : null;
    // anotherQuestion = json['another_question'] != null
    //     ? AnotherQuestion.fromJson(json['another_question'])
    //     : null;
    if (json['answer_question'] != null) {
      answersList = <AnswerQuestion>[];
      json['answer_question'].forEach((v) {
        answersList!.add(AnswerQuestion.fromJson(v));
      });
    }
  }

}

class Question {
  String? ar;
  String? en;

  Question({this.ar, this.en});

  Question.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

}

class AnotherQuestion {
  int? id;
  Question? question;

  AnotherQuestion({this.id, this.question});

  AnotherQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'] != null
        ? Question.fromJson(json['question'])
        : null;
  }

}

class AnswerQuestion {
  Question? answers;

  AnswerQuestion({this.answers});

  AnswerQuestion.fromJson(Map<String, dynamic> json) {
    answers =
        json['answers'] != null ? Question.fromJson(json['answers']) : null;
  }

}