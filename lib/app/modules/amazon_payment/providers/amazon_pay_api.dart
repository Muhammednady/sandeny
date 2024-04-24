import 'package:amazon_payfort/amazon_payfort.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/amazon_payment/models/sdk_token_response.dart';

import '../../../../constants/amazon_payment_configurations.dart';
import '../../../../constants/httpHelper.dart';
import '../../../../widgets/not_authenticated_user.dart';

class AmazonPayApi {
  AmazonPayApi._();

  static Future<SdkTokenResponse?> generateSdkToken(
      SdkTokenRequest request) async {
    var response = await post(
      // for the test enviroment
      Uri.parse(AmazonPayConfigue.testEnviroment.paymentApi),
      // for the production enviroment
      // Uri.parse(AmazonPayConfigue.productionEnviroment.paymentApi),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.asRequest()),
    );
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      log('sdkTokenResponse: $decodedResponse');
      return SdkTokenResponse.fromMap(decodedResponse);
    }
    return null;
  }

//   static Future<SdkTokenResponse?> generateSdkToken({
//     required String? deviceId,
//     required String? accessCode,
//     required String? lang,
//     required String? signature,
//     required String? merchantId,
//     required int? urlType,
//   }) async {
//     final storage = GetStorage();
//     var uri = Uri.parse('${HttpHelper.baseUrl}${HttpHelper.generateSdkToken}');
//     var params = {
//       'device_id': deviceId,
//       'access_code': accessCode,
//       'lang': lang,
//       'signature': signature,
//       'merchant_identifier': merchantId,
//       'url_type': urlType.toString(),
//     };

//     var response = await get(
//       uri.replace(queryParameters: params),
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer ${storage.read('token')}',
//       },
//     );

//     log('this is the response : ${response.body}');

//     if (response.statusCode == 200) {
//       var decodedResponse = jsonDecode(response.body);
//       return SdkTokenResponse.fromJson(decodedResponse);
//     }
//     if (response.statusCode == 401) {
//       userNotRegisteredWidget(Get.context!);
//     }
//     return null;
//   }
// }
}
