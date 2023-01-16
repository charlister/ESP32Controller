import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sensorsinfos/model/sensor_model.dart';
import 'package:sensorsinfos/service/sensor_service.dart';

part 'sensor_data_state.dart';

class SensorDataCubit extends Cubit<SensorDataState> {
  late Timer _timer;

  SensorDataCubit() : super(SensorDataInitial());

  void getSensorData(String ip, String port) {
    emit(SensorDataLoading());
    _timer = Timer.periodic(
      const Duration(seconds: 10),
      (_) => _fetchData(ip, port)
    );
  }

  Future<void> _fetchData(String ip, String port) async {
    try {
      final result = await SensorService.getData(ip: ip, port: port);
      emit(SensorDataLoaded(result));
    } on Exception {
      emit(SensorDataError("Erreur de réception des données."));
    }
  }
}
