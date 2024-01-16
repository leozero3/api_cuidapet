import 'dart:convert';
import 'package:crypto/crypto.dart';

class CriptyHelper {
  CriptyHelper._();

  static String generateSha256Hassh(String password) {
    final bytes = utf8.encode(password);
    return sha256.convert(bytes).toString();
  }
}
