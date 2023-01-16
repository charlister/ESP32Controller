class PhotoresistorModel {
  num? rawValue;
  num? lightLevel;
  String? lightLevelDesc;

  PhotoresistorModel({this.rawValue, this.lightLevel, this.lightLevelDesc});

  PhotoresistorModel.fromJson(Map<String, dynamic> json) {
    rawValue = json['raw_value'];
    lightLevel = json['light_level'];
    lightLevelDesc = json['light_level_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['raw_value'] = this.rawValue;
    data['light_level'] = this.lightLevel;
    data['light_level_desc'] = this.lightLevelDesc;
    return data;
  }
}