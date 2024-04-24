class ProgramDetailsModel {
  ProgramDetailsData? data;
  String? msg;
  int? code;

  ProgramDetailsModel({this.data, this.msg, this.code});

  ProgramDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ProgramDetailsData.fromJson(json['data']) : null;
    msg = json['msg'];
    code = json['code'];
  }

}

class ProgramDetailsData {
  int? id;
  Name? name;
  Name? overview;
  int? totalSessions;
  int? stagesCount;
  List<Stages>? stages;
  List<Goals>? goals;
  int? price;
  String? image;
  bool? isPaid;

  ProgramDetailsData(
      {this.id,
      this.name,
      this.overview,
      this.totalSessions,
      this.stagesCount,
      this.stages,
      this.goals,
      this.price,
      this.image,
      this.isPaid});

  ProgramDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    overview =
        json['overview'] != null ? Name.fromJson(json['overview']) : null;
    totalSessions = json['total_sessions'];
    stagesCount = json['stages_count'];
    if (json['stages'] != null) {
      stages = <Stages>[];
      json['stages'].forEach((v) {
        stages!.add(Stages.fromJson(v));
      });
    }
    if (json['goals'] != null) {
      goals = <Goals>[];
      json['goals'].forEach((v) {
        goals!.add(Goals.fromJson(v));
      });
    }
    price = json['price'];
    image = json['image'];
    isPaid = json['is_paid'];
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

class Stages {
  int? id;
  Name? name;
  Name? description;
  String? file;
  String? link;
  int? programId;
  String? createdAt;
  String? updatedAt;

  Stages(
      {this.id,
      this.name,
      this.description,
      this.file,
      this.link,
      this.programId,
      this.createdAt,
      this.updatedAt});

  Stages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    description = json['description'] != null
        ? Name.fromJson(json['description'])
        : null;
    file = json['file'];
    link = json['link'];
    programId = json['program_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class Goals {
  int? id;
  Name? name;
  Name? description;
  int? programId;
  void createdAt;
  void updatedAt;

  Goals(
      {this.id,
      this.name,
      this.description,
      this.programId,
      this.createdAt,
      this.updatedAt});

  Goals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    description = json['description'] != null
        ? Name.fromJson(json['description'])
        : null;
    programId = json['program_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

// class ProgramDetailsModel {
//   ProgramDetailsData? data;
//   String? msg;
//   int? code;

//   ProgramDetailsModel({this.data, this.msg, this.code});

//   ProgramDetailsModel.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? ProgramDetailsData.fromJson(json['data']) : null;
//     msg = json['msg'];
//     code = json['code'];
//   }

// }

// class ProgramDetailsData {
//   Name? name;
//   Name? overview;
//   Name? goals;
//   int? totalSessions;
//   int? stagesCount;
//   List<Stages>? stages;
//   int? price;
//   String? image;
//   bool? isPaid;

//   ProgramDetailsData(
//       {this.name,
//       this.overview,
//       this.goals,
//       this.totalSessions,
//       this.stagesCount,
//       this.stages,
//       this.price,
//       this.image,
//       this.isPaid});

//   ProgramDetailsData.fromJson(Map<String, dynamic> json) {
//     name = json['name'] != null ? Name.fromJson(json['name']) : null;
//     overview =
//         json['overview'] != null ? Name.fromJson(json['overview']) : null;
//     goals = json['goals'] != null ? Name.fromJson(json['goals']) : null;
//     totalSessions = json['total_sessions'];
//     stagesCount = json['stages_count'];
//     if (json['stages'] != null) {
//       stages = <Stages>[];
//       json['stages'].forEach((v) {
//         stages!.add(Stages.fromJson(v));
//       });
//     }
//     price = json['price'];
//     image = json['image'];
//     isPaid = json['is_paid'];
//   }

// }

// class Name {
//   String? ar;
//   String? en;

//   Name({this.ar, this.en});

//   Name.fromJson(Map<String, dynamic> json) {
//     ar = json['ar'];
//     en = json['en'];
//   }

// }

// class Stages {
//   int? id;
//   Name? name;
//   Name? description;
//   String? file;
//   String? link;
//   int? programId;
//   String? createdAt;
//   String? updatedAt;

//   Stages(
//       {this.id,
//       this.name,
//       this.description,
//       this.file,
//       this.link,
//       this.programId,
//       this.createdAt,
//       this.updatedAt});

//   Stages.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'] != null ? Name.fromJson(json['name']) : null;
//     description = json['description'] != null
//         ? Name.fromJson(json['description'])
//         : null;
//     file = json['file'];
//     link = json['link'];
//     programId = json['program_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

// }