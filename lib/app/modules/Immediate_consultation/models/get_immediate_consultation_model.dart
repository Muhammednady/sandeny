class GetImmediateConsultation {
  ICData? data;
  String? msg;
  int? code;

  GetImmediateConsultation({this.data, this.msg, this.code});

  GetImmediateConsultation.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ICData.fromJson(json['data']) : null;
    msg = json['msg'];
    code = json['code'];
  }

}

class ICData {
  List<Departments>? departments;
  List<SpecializationTypes>? specializationTypes;
  List<Periods>? periods;
  List<Types>? types;
  List<Feelings>? feelings;

  ICData(
      {this.departments,
      this.specializationTypes,
      this.periods,
      this.types,
      this.feelings});

  ICData.fromJson(Map<String, dynamic> json) {
    if (json['departments'] != null) {
      departments = <Departments>[];
      json['departments'].forEach((v) {
        departments!.add(Departments.fromJson(v));
      });
    }
    if (json['specialization_types'] != null) {
      specializationTypes = <SpecializationTypes>[];
      json['specialization_types'].forEach((v) {
        specializationTypes!.add(SpecializationTypes.fromJson(v));
      });
    }
    if (json['periods'] != null) {
      periods = <Periods>[];
      json['periods'].forEach((v) {
        periods!.add(Periods.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    if (json['feelings'] != null) {
      feelings = <Feelings>[];
      json['feelings'].forEach((v) {
        feelings!.add(Feelings.fromJson(v));
      });
    }
  }

}

class Departments {
  int? id;
  Name? name;

  Departments({this.id, this.name});

  Departments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
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

class SpecializationTypes {
  int? id;
  Name? title;

  SpecializationTypes({this.id, this.title});

  SpecializationTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Name.fromJson(json['title']) : null;
  }

}

class Periods {
  int? id;
  Name? title;

  Periods({this.id, this.title});

  Periods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Name.fromJson(json['title']) : null;
  }

}

class Types {
  int? id;
  Name? title;

  Types({this.id, this.title});

  Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Name.fromJson(json['title']) : null;
  }

}

class Feelings {
  int? id;
  Name? title;

  Feelings({this.id, this.title});

  Feelings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Name.fromJson(json['title']) : null;
  }

}