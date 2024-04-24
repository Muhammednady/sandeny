class GetBilateralSessionDetailsModel {
  Data? data;
  String? msg;
  int? code;

  GetBilateralSessionDetailsModel({this.data, this.msg, this.code});

  GetBilateralSessionDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int? period;
  String? startAt;
  String? price;
  String? tax;
  String? discountValue;
  String? totalPrice;

  Data(
      {this.doctorId,
      this.name,
      this.profileImage,
      this.specializations,
      this.period,
      this.startAt,
      this.price,
      this.tax,
      this.discountValue,
      this.totalPrice});

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
    period = json['period'];
    startAt = json['start_at'];
    price = json['price'];
    tax = json['tax'];
    discountValue = json['Discount_value'];
    totalPrice = json['total_price'];
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
    data['period'] = period;
    data['start_at'] = startAt;
    data['price'] = price;
    data['tax'] = tax;
    data['Discount_value'] = discountValue;
    data['total_price'] = totalPrice;
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
