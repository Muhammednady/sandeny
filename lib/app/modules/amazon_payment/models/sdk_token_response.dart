class SdkTokenResponse {
  SdkTokenResponse({
    this.responseCode,
    this.deviceId,
    this.responseMessage,
    this.serviceCommand,
    this.sdkToken,
    this.signature,
    this.merchantIdentifier,
    this.accessCode,
    this.language,
    this.status,
  });

  String? responseCode;
  String? deviceId;
  String? responseMessage;
  String? serviceCommand;
  String? sdkToken;
  String? signature;
  String? merchantIdentifier;
  String? accessCode;
  String? language;
  String? status;

  factory SdkTokenResponse.fromMap(Map<String, dynamic> data) {
    return SdkTokenResponse(
      responseCode: data['response_code'],
      deviceId: data['device_id'],
      responseMessage: data['response_message'],
      serviceCommand: data['service_command'],
      sdkToken: data['sdk_token'],
      signature: data['signature'],
      merchantIdentifier: data['merchant_identifier'],
      accessCode: data['access_code'],
      language: data['language'],
      status: data['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'response_code': responseCode,
      'device_id': deviceId,
      'response_message': responseMessage,
      'service_command': serviceCommand,
      'sdk_token': sdkToken,
      'signature': signature,
      'merchant_identifier': merchantIdentifier,
      'access_code': accessCode,
      'language': language,
      'status': status,
    };
  }
}

// class SdkTokenResponse {
//   String? responseCode;
//   String? deviceId;
//   String? responseMessage;
//   String? serviceCommand;
//   String? sdkToken;
//   String? signature;
//   String? merchantIdentifier;
//   String? accessCode;
//   String? language;
//   String? status;

//   SdkTokenResponse(
//       {this.responseCode,
//       this.deviceId,
//       this.responseMessage,
//       this.serviceCommand,
//       this.sdkToken,
//       this.signature,
//       this.merchantIdentifier,
//       this.accessCode,
//       this.language,
//       this.status});

//   SdkTokenResponse.fromJson(Map<String, dynamic> json) {
//     responseCode = json['response_code'];
//     deviceId = json['device_id'];
//     responseMessage = json['response_message'];
//     serviceCommand = json['service_command'];
//     sdkToken = json['sdk_token'];
//     signature = json['signature'];
//     merchantIdentifier = json['merchant_identifier'];
//     accessCode = json['access_code'];
//     language = json['language'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['response_code'] = this.responseCode;
//     data['device_id'] = this.deviceId;
//     data['response_message'] = this.responseMessage;
//     data['service_command'] = this.serviceCommand;
//     data['sdk_token'] = this.sdkToken;
//     data['signature'] = this.signature;
//     data['merchant_identifier'] = this.merchantIdentifier;
//     data['access_code'] = this.accessCode;
//     data['language'] = this.language;
//     data['status'] = this.status;
//     return data;
//   }
// }
