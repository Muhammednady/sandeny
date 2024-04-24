// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:mockito/mockito.dart';
// import 'package:http/http.dart' as http;
// import 'package:sandeny/app/modules/Auth/models/login_model.dart';
// import 'package:sandeny/app/modules/Auth/providers/login_provider.dart';
// import 'package:sandeny/constants/httpHelper.dart';

// class MockClient extends Mock implements http.Client {}

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   // Create a mock HTTP client
//   final client = MockClient();

//   // Create an instance of your LoginProvider
//   final loginProvider = LoginProvider();

//   // Initialize your test
//   setUp(() {
//     WidgetsFlutterBinding.ensureInitialized();
//     // loginProvider.httpClient = client;
//     loginProvider;
//   });

//   // Write your test case
//   test('login should return a LoginModel', () async {
//     // Mock the response from the HTTP client
//     when(client.post(
//       Uri.parse(HttpHelper.baseUrl + HttpHelper.login),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         "phone": "+966558412655",
//         "password": "12345678",
//         "fcmToken":
//             'cDxmMwzXtkx-neIE8mJzia:APA91bEyJbksdh_GSobUvNVwrdfeVMnDt1LViQJbRmbV-E_oL3el7am67GsTvBp_HqnUJEZydZAcHd-ai2UoyJmZhhpj9hXwvB4OysVeU0OFtC3PAtPCRbUO8xjgclpfcq1Mg4-b-Ik1',
//         "lang": "en",
//       }),
//     )).thenAnswer((_) async => http.Response('{"code":1}', 200));

//     // Call the login method and capture the response
//     final request = await loginProvider.login(
//       phone: "+966558412655",
//       password: "12345678",
//       fcmToken:
//           'cDxmMwzXtkx-neIE8mJzia:APA91bEyJbksdh_GSobUvNVwrdfeVMnDt1LViQJbRmbV-E_oL3el7am67GsTvBp_HqnUJEZydZAcHd-ai2UoyJmZhhpj9hXwvB4OysVeU0OFtC3PAtPCRbUO8xjgclpfcq1Mg4-b-Ik1',
//       lang: "en",
//     );

//     // Assert that the response is of type LoginModel and has the expected token
//     // expect(response, isA<LoginModel>());
//     expect(response.code, 1);
//   });
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:mockito/mockito.dart';
// import 'package:sandeny/app/modules/Auth/models/login_model.dart';
// import 'package:sandeny/app/modules/Auth/providers/login_provider.dart';
// import 'package:sandeny/constants/httpHelper.dart';

// class MockClient extends Mock implements http.Client {}

// void main() {

//   WidgetsFlutterBinding.ensureInitialized();
//   // Create a mock HTTP client
//   final client = MockClient();

//   // Create an instance of your LoginProvider
//   final loginProvider = LoginProvider();

//   // Initialize your test
//   setUp(() {
//     loginProvider;
//   });

//   // Write your test case
//   test('login should return a LoginModel when API response code is 1',
//       () async {
//     // Mock the response from the HTTP client
//     when(client.post(
//       Uri.parse(HttpHelper.baseUrl + HttpHelper.login),
//       body: {
//         "phone": "+966558412655",
//         "password": "12345678",
//         "fcmToken":
//             'cDxmMwzXtkx-neIE8mJzia:APA91bEyJbksdh_GSobUvNVwrdfeVMnDt1LViQJbRmbV-E_oL3el7am67GsTvBp_HqnUJEZydZAcHd-ai2UoyJmZhhpj9hXwvB4OysVeU0OFtC3PAtPCRbUO8xjgclpfcq1Mg4-b-Ik1',
//         "lang": "en", // Add your language here
//       },
//     )).thenAnswer((_) async =>
//         http.Response('{"code":1}', 200)); // Mock the response JSON

//     // Call the login method
//     final response = await loginProvider.login(
//       phone: "+966558412655",
//       password: "12345678",
//       fcmToken:
//           'cDxmMwzXtkx-neIE8mJzia:APA91bEyJbksdh_GSobUvNVwrdfeVMnDt1LViQJbRmbV-E_oL3el7am67GsTvBp_HqnUJEZydZAcHd-ai2UoyJmZhhpj9hXwvB4OysVeU0OFtC3PAtPCRbUO8xjgclpfcq1Mg4-b-Ik1',
//       lang: "en", // Add your language here
//     );

//     // Assert that the response is of type LoginModel
//     expect(response, isA<LoginModel>());

//     // Assert that the response code is 1
//     expect(response.code, 1);
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:sandeny/app/modules/Auth/models/login_model.dart';
import 'package:sandeny/app/modules/Auth/providers/login_provider.dart';
import 'package:sandeny/constants/httpHelper.dart';

class MockClient extends Mock implements http.Client {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  // Create a mock HTTP client
  final client = MockClient();

  // Create an instance of your LoginProvider
  final loginProvider = LoginProvider();

  // Initialize your test
  setUp(() {
    loginProvider;
  });

  // Write your test case
  test('login should return a LoginModel when API response code is 1',
      () async {
    // Mock the response from the HTTP client
    when(client.post(
      Uri.parse(HttpHelper.baseUrl + HttpHelper.login),
      body: {
        "phone": "+966558412655",
        "password": "12345678",
        "fcmToken":
            'cDxmMwzXtkx-neIE8mJzia:APA91bEyJbksdh_GSobUvNVwrdfeVMnDt1LViQJbRmbV-E_oL3el7am67GsTvBp_HqnUJEZydZAcHd-ai2UoyJmZhhpj9hXwvB4OysVeU0OFtC3PAtPCRbUO8xjgclpfcq1Mg4-b-Ik1',
        "lang": "en", // Add your language here
      },
    )).thenAnswer((_) async =>
        http.Response('{"code":1}', 200)); // Mock the response JSON

    // Call the login method
    final response = await loginProvider.login(
      phone: "+966558412655",
      password: "12345678",
      fcmToken:
          'cDxmMwzXtkx-neIE8mJzia:APA91bEyJbksdh_GSobUvNVwrdfeVMnDt1LViQJbRmbV-E_oL3el7am67GsTvBp_HqnUJEZydZAcHd-ai2UoyJmZhhpj9hXwvB4OysVeU0OFtC3PAtPCRbUO8xjgclpfcq1Mg4-b-Ik1',
      lang: "en", // Add your language here
    );

    // Assert that the response is of type LoginModel
    expect(response, isA<LoginModel>());

    // Assert that the response code is 1
    expect(response.code, 1);
  });
}
