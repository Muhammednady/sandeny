class GetBilateralSession {
  Data? data;
  String? msg;
  int? code;

  GetBilateralSession({this.data, this.msg, this.code});

  GetBilateralSession.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    msg = json['msg'];
    code = json['code'];
  }

}

class Data {
  List<Departments>? departments;
  List<SpecializationTypes>? specializationTypes;
  List<Periods>? periods;
  List<Types>? types;

  Data({this.departments, this.specializationTypes, this.periods, this.types});

  Data.fromJson(Map<String, dynamic> json) {
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