class GetImmediateConsultationPrice {
  Data? data;
  String? msg;
  int? code;

  GetImmediateConsultationPrice({this.data, this.msg, this.code});

  GetImmediateConsultationPrice.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    msg = json['msg'];
    code = json['code'];
  }

}

class Data {
  Slot? slot;

  Data({this.slot});

  Data.fromJson(Map<String, dynamic> json) {
    slot = json['slot'] != null ? Slot.fromJson(json['slot']) : null;
  }

}

class Slot {
  int? id;
  SpecializationType? specializationType;
  SpecializationType? period;
  String? price;
  int? commission;
  String? totalPrice;

  Slot(
      {this.id,
      this.specializationType,
      this.period,
      this.price,
      this.commission,
      this.totalPrice});

  Slot.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    specializationType = json['specialization_type'] != null
        ? SpecializationType.fromJson(json['specialization_type'] ?? 0)
        : null;
    period = json['period'] != null
        ? SpecializationType.fromJson(json['period'] ?? 0)
        : null;
    price = json['price'] ?? 0;
    commission = json['commission'] ?? 0;
    totalPrice = json['total_price'] ?? 0;
  }

}

class SpecializationType {
  int? id;
  Title? title;

  SpecializationType({this.id, this.title});

  SpecializationType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
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

}