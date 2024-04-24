class MedicalFileQuestionsModel {
  int? currentPage;
  List<QuestionData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  MedicalFileQuestionsModel(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  MedicalFileQuestionsModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'] ?? 1;
    if (json['data'] != null) {
      data = <QuestionData>[];
      json['data'].forEach((v) {
        data!.add(QuestionData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'] ?? '';
    from = json['from'] ?? 1;
    lastPage = json['last_page'] ?? 1;
    lastPageUrl = json['last_page_url'] ?? '';
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'] ?? '';
    path = json['path'] ?? '';
    perPage = json['per_page'] ?? 1;
    prevPageUrl = json['prev_page_url'] ?? '';
    to = json['to'] ?? 1;
    total = json['total'] ?? 1;
  }
}

class QuestionData {
  int? id;
  int? isMultiple;
  Question? question;
  List<Answers>? answersList;
  AnotherQuestion? anotherQuestion;

  QuestionData(
      {this.id, this.question, this.answersList, this.anotherQuestion});

  QuestionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question =
        json['question'] != null ? Question.fromJson(json['question']) : null;
    isMultiple = json['is_multiple'] ?? 1;
    if (json['answers'] != null) {
      answersList = <Answers>[];
      json['answers'].forEach((v) {
        answersList!.add(Answers.fromJson(v));
      });
    }
    anotherQuestion = json['another_question'] != null
        ? AnotherQuestion.fromJson(json['another_question'])
        : null;
  }
}

class Question {
  String? ar;
  String? en;

  Question({
    this.ar,
    this.en,
  });

  Question.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }
}

class Answers {
  int? id;
  Question? answers;

  Answers({this.answers});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answers =
        json['answers'] != null ? Question.fromJson(json['answers']) : null;
  }
}

class AnotherQuestion {
  int? id;
  Question? question;

  AnotherQuestion({this.id, this.question});

  AnotherQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question =
        json['question'] != null ? Question.fromJson(json['question']) : null;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
}
