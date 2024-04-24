class GetInstantSessionDetails {
  Data? data;
  String? msg;
  int? code;

  GetInstantSessionDetails({this.data, this.msg, this.code});

  GetInstantSessionDetails.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    msg = json['msg'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = msg;
    data['code'] = code;
    return data;
  }
}

class Data {
  int? doctorId;
  String? name;
  String? profileImage;
  List<Specializations>? specializations;
  int? slotId;
  Period? period;
  String? price;
  String? tax;
  String? totalPrice;
  List<Types>? types;

  Data(
      {this.doctorId,
      this.name,
      this.profileImage,
      this.specializations,
      this.slotId,
      this.period,
      this.price,
      this.tax,
      this.totalPrice,
      this.types});

  Data.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    name = json['name'];
    profileImage = json['profile_image'];
    if (json['specializations'] != null) {
      specializations = <Specializations>[];
      json['specializations'].forEach((v) {
        specializations!.add(Specializations.fromJson(v));
      });
    }
    slotId = json['slot_id'];
    period =
        json['period'] != null ? Period.fromJson(json['period']) : null;
    price = json['price'];
    tax = json['tax'];
    totalPrice = json['total_price'];
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor_id'] = doctorId;
    data['name'] = name;
    data['profile_image'] = profileImage;
    if (specializations != null) {
      data['specializations'] =
          specializations!.map((v) => v.toJson()).toList();
    }
    data['slot_id'] = slotId;
    if (period != null) {
      data['period'] = period!.toJson();
    }
    data['price'] = price;
    data['tax'] = tax;
    data['total_price'] = totalPrice;
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specializations {
  Name? name;

  Specializations({this.name});

  Specializations.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
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

class Period {
  int? id;
  Title? title;

  Period({this.id, this.title});

  Period.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
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

class Title {
  String? ar;
  String? en;

  Title({this.ar, this.en});

  Title.fromJson(Map<String, dynamic> json) {
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

class Types {
  int? id;
  Title? title;

  Types({this.id, this.title});

  Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
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