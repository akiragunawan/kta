import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LS extends FlutterSecureStorage {
  static final LS _lS = LS._internal();

  factory LS() {
    return _lS;
  }

  LS._internal();
}
