class PriceListModel {
  List<PricesList>? data;
  String? msg;
  int? code;

  PriceListModel({this.data, this.msg, this.code});

  PriceListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PricesList>[];
      json['data'].forEach((v) {
        data!.add(PricesList.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }
}

class PricesList {
  int? id;
  String? fromTo;

  PricesList({this.id, this.fromTo});

  PricesList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromTo = json['from_to'];
  }

}