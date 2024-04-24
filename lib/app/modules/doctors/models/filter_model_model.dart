class FilterModel {
  List<FilterData>? data;
  String? msg;
  int? code;

  FilterModel({this.data, this.msg, this.code});

  FilterModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FilterData>[];
      json['data'].forEach((v) {
        data!.add(FilterData.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }
}

class FilterData {
  int? id;
  String? name;
  String? rateAvg;
  int? rateCount;
  int? consultationPrice;
  int? yearsOfExperience;
  Description? description;
  String? profileImage;
  List<Specializations>? specializations;
  List<Skills>? skills;
  List<Experiences>? experiences;
  List<Languages>? languages;
  List<Rates>? rates;

  FilterData(
      {this.id,
      this.name,
      this.rateAvg,
      this.rateCount,
      this.consultationPrice,
      this.yearsOfExperience,
      this.description,
      this.profileImage,
      this.specializations,
      this.skills,
      this.experiences,
      this.languages,
      this.rates});

  FilterData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rateAvg = json['rate_avg'];
    rateCount = json['rate_count'];
    consultationPrice = json['consultation_price'];
    yearsOfExperience = json['years_of_experience'];
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    profileImage = json['profile_image'];
    if (json['specializations'] != null) {
      specializations = <Specializations>[];
      json['specializations'].forEach((v) {
        specializations!.add(Specializations.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(Skills.fromJson(v));
      });
    }
    if (json['experiences'] != null) {
      experiences = <Experiences>[];
      json['experiences'].forEach((v) {
        experiences!.add(Experiences.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
    if (json['rates'] != null) {
      rates = <Rates>[];
      json['rates'].forEach((v) {
        rates!.add(Rates.fromJson(v));
      });
    }
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ar'] = ar;
    data['en'] = en;
    return data;
  }
}

class Skills {
  Description? name;

  Skills({this.name});

  Skills.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Description.fromJson(json['name']) : null;
  }
}

class Specializations {
  Description? name;

  Specializations({this.name});

  Specializations.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Description.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name!.toJson();
    }
    return data;
  }
}

class Name {
  int? id;
  String? ar;
  String? en;

  Name({this.id, this.ar, this.en});

  Name.fromJson(Map<String, dynamic> json) {
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

class Experiences {
  Experience? experience;

  Experiences({this.experience});

  Experiences.fromJson(Map<String, dynamic> json) {
    experience = json['experience'] != null
        ? Experience.fromJson(json['experience'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (experience != null) {
      data['experience'] = experience!.toJson();
    }
    return data;
  }
}

class Experience {
  int? id;
  String? from;
  String? to;
  String? ar;
  String? en;

  Experience({this.id, this.from, this.to, this.ar, this.en});

  Experience.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    from = json['from'];
    to = json['to'];
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['from'] = from;
    data['to'] = to;
    data['ar'] = ar;
    data['en'] = en;
    return data;
  }
}

class Languages {
  int? id;
  Description? language;

  Languages({this.id, this.language});

  Languages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    language = json['language'] != null
        ? Description.fromJson(json['language'])
        : null;
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

class Rates {
  String? createdAtEn;
  String? userName;
  String? comment;
  int? rate;

  Rates({this.createdAtEn, this.userName, this.comment, this.rate});

  Rates.fromJson(Map<String, dynamic> json) {
    createdAtEn = json['created_at_en'];
    userName = json['user_name'];
    comment = json['comment'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at_en'] = createdAtEn;
    data['user_name'] = userName;
    data['comment'] = comment;
    data['rate'] = rate;
    return data;
  }
}