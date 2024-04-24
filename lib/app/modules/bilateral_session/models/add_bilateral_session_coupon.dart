class AddBilateralSessionCoupon {
  Data? data;
  String? msg;
  int? code;

  AddBilateralSessionCoupon({this.data, this.msg, this.code});

  AddBilateralSessionCoupon.fromJson(Map<String, dynamic> json) {
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
  double? price;
  String? tax;
  bool? isRate;
  String? discountRate;
  String? discountValue;
  String? totalPrice;

  Data(
      {this.price,
      this.tax,
      this.isRate,
      this.discountRate,
      this.discountValue,
      this.totalPrice});

  Data.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    tax = json['tax'];
    isRate = json['is_rate'];
    discountRate = json['Discount_rate'];
    discountValue = json['Discount_value'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['tax'] = tax;
    data['is_rate'] = isRate;
    data['Discount_rate'] = discountRate;
    data['Discount_value'] = discountValue;
    data['total_price'] = totalPrice;
    return data;
  }
}
