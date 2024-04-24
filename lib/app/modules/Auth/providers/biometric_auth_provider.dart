import 'package:local_auth/local_auth.dart';

class BiometricAuth {

  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<bool> isBiometricAuthEnabled() async {
    bool biometricEnabled = await _localAuthentication.canCheckBiometrics;
    return biometricEnabled;
  }

  Future<bool> isAuth(String message) async {
    try {
      bool biometricAuth = await _localAuthentication.authenticate(
          localizedReason: message,
          options: const AuthenticationOptions(
            biometricOnly: true,
          ),
          );

      return biometricAuth;
    } catch (e) {
      return false;
    }
  }
}
