class ThermistorModel {
  num? rawValue;
  num? temperature;
  String? temperatureDesc;

  ThermistorModel({this.rawValue, this.temperature, this.temperatureDesc});

  ThermistorModel.fromJson(Map<String, dynamic> json) {
    rawValue = json['raw_value'];
    temperature = json['temperature'];
    temperatureDesc = json['temperature_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['raw_value'] = this.rawValue;
    data['temperature'] = this.temperature;
    data['temperature_desc'] = this.temperatureDesc;
    return data;
  }
}