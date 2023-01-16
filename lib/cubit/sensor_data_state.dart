part of 'sensor_data_cubit.dart';

@immutable
abstract class SensorDataState {}

class SensorDataInitial extends SensorDataState {}

class SensorDataLoading extends SensorDataState {}

class SensorDataLoaded extends SensorDataState {
  final SensorModel sensorModel;

  SensorDataLoaded(this.sensorModel);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SensorDataLoaded && other.sensorModel == sensorModel;
  }

  @override
  int get hashCode => sensorModel.hashCode;
}

class SensorDataError extends SensorDataState {
  final String message;

  SensorDataError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SensorDataError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
