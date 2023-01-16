import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ControlLedService {
  static Future<String> setCmdLedValue({required String ip, required String port, required String cmd}) async {
    debugPrint("Exécution de la méthode setCmdLedValue");
    var finalUrl = "http://$ip:$port/esp32api/lighting?cmd=$cmd";

    final response = await get(Uri.parse(finalUrl));
    debugPrint("URL: ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      debugPrint("set lighting result: ${response.body}");
      return response.body;
    }
    else {
      throw Exception("Erreur de traitement de la requête.");
    }
  }
}