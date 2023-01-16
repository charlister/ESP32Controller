import 'package:sensorsinfos/model/photoresistor_model.dart';
import 'package:sensorsinfos/model/thermistor_model.dart';

class SensorModel {
  PhotoresistorModel? photoresistor;
  ThermistorModel? thermistor;

  SensorModel({this.photoresistor, this.thermistor});

  SensorModel.fromJson(Map<String, dynamic> json) {
    photoresistor = json['photoresistor'] != null
        ? PhotoresistorModel.fromJson(json['photoresistor'])
        : null;
    thermistor = json['thermistor'] != null
        ? ThermistorModel.fromJson(json['thermistor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.photoresistor != null) {
      data['photoresistor'] = this.photoresistor!.toJson();
    }
    if (this.thermistor != null) {
      data['thermistor'] = this.thermistor!.toJson();
    }
    return data;
  }
}