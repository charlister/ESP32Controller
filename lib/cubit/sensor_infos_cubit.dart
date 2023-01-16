import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sensorsinfos/service/sensor_service.dart';

part 'sensor_infos_state.dart';

class SensorInfosCubit extends Cubit<SensorInfosState> {
  SensorInfosCubit() : super(SensorInfosInitial());

  Future<void> getSensorInfo(String ip, String port) async {
    emit(SensorInfosLoading());
    try {
      final result = await SensorService.getSensorsInfos(ip: ip, port: port);
      emit(SensorInfosLoaded(result));
    } on Exception {
      emit(SensorInfosError("Erreur de réception des données."));
    }
  }
}
