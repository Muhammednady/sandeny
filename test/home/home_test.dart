
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sandeny/app/modules/home/models/best_doctors_model.dart';
import 'package:sandeny/app/modules/home/providers/best_doctors.dart';
import 'package:sandeny/constants/httpHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // GetStorage storage = GetStorage();
  var bestDoctorProvider = Get.put(BestDoctorsProvider());
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    // storage = GetStorage();
  });
  test('bestDoctors', () async {
    SharedPreferences.setMockInitialValues({});
    SharedPreferences pref = await SharedPreferences.getInstance();

    final client = MockClient();

    when(client
        .get(Uri.parse(HttpHelper.baseUrl + HttpHelper.bestDoctors), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${pref.getString('token')}',
    })).thenAnswer((_) async => http.Response('{"code":1}', 200));
    final response = await bestDoctorProvider.getBestDoctors(client);

    expect(response, isA<BestDoctorsModel>());
    expect(response.code, 1);
  });
}
