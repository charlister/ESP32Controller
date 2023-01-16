part of 'sensor_infos_cubit.dart';

@immutable
abstract class SensorInfosState {}

class SensorInfosInitial extends SensorInfosState {}

class SensorInfosLoading extends SensorInfosState {}

class SensorInfosLoaded extends SensorInfosState {
  final String infos;

  SensorInfosLoaded(this.infos);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SensorInfosLoaded && other.infos == infos;
  }

  @override
  int get hashCode => infos.hashCode;
}

class SensorInfosError extends SensorInfosState {
  final String message;

  SensorInfosError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SensorInfosError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
