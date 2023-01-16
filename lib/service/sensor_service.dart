import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sensorsinfos/model/sensor_model.dart';

class SensorService {
  static Future<SensorModel> getData({required String ip, required String port}) async {
    debugPrint("Exécution de la méthode getData");
    var finalUrl = "http://$ip:$port/esp32api/data";

    final response = await get(Uri.parse(finalUrl));
    debugPrint("URL: ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      debugPrint("sensor data: ${response.body}");
      return SensorModel.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("Erreur de traitement de la requête");
    }
  }

  static Future<String> getSensorsInfos({required String ip, required String port}) async {
    debugPrint("Exécution de la méthode getSensorsInfos");
    var finalUrl = "http://$ip:$port/esp32api/infos";

    final response = await get(Uri.parse(finalUrl));
    debugPrint("URL: ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      debugPrint("sensors infos: ${response.body}");
      return response.body;
    }
    else {
      throw Exception("Erreur de traitement de la requête");
    }
  }
}