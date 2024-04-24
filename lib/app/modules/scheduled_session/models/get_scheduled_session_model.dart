class GetScheduledSession {
  Data? data;
  String? msg;
  int? code;

  GetScheduledSession({this.data, this.msg, this.code});

  GetScheduledSession.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    msg = json['msg'];
    code = json['code'];
  }

}

class Data {
  List<Departments>? departments;
  List<SpecializationTypes>? specializationTypes;
  List<YearExperiences>? yearExperiences;
  List<Periods>? periods;
  List<PricesRange>? pricesRange;
  List<Gender>? gender;
  List<Languages>? languages;
  List<Feelings>? feelings;

  Data(
      {this.departments,
      this.specializationTypes,
      this.yearExperiences,
      this.periods,
      this.pricesRange,
      this.gender,
      this.languages,
      this.feelings});

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
    if (json['year_experiences'] != null) {
      yearExperiences = <YearExperiences>[];
      json['year_experiences'].forEach((v) {
        yearExperiences!.add(YearExperiences.fromJson(v));
      });
    }
    if (json['periods'] != null) {
      periods = <Periods>[];
      json['periods'].forEach((v) {
        periods!.add(Periods.fromJson(v));
      });
    }
    if (json['prices_range'] != null) {
      pricesRange = <PricesRange>[];
      json['prices_range'].forEach((v) {
        pricesRange!.add(PricesRange.fromJson(v));
      });
    }
    if (json['gender'] != null) {
      gender = <Gender>[];
      json['gender'].forEach((v) {
        gender!.add(Gender.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ar'] = ar;
    data['en'] = en;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    return data;
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

class PricesRange {
  int? id;
  String? fromTo;

  PricesRange({this.id, this.fromTo});

  PricesRange.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromTo = json['from_to'];
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

class YearExperiences {
  int? id;
  String? fromTo;

  YearExperiences({this.id, this.fromTo});

  YearExperiences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromTo = json['from_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['from_to'] = fromTo;
    return data;
  }
}

class Gender {
  int? id;
  String? ar;
  String? en;

  Gender({this.id, this.ar, this.en});

  Gender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ar'] = ar;
    data['en'] = en;
    return data;
  }
}

class Languages {
  int? id;
  Name? language;

  Languages({this.id, this.language});

  Languages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    language =
        json['language'] != null ? Name.fromJson(json['language']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    return data;
  }
}
