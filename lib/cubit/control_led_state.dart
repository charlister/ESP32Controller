part of 'control_led_cubit.dart';

@immutable
abstract class ControlLedState {}

class ControlLedInitial extends ControlLedState {}

class ControlLedLoading extends ControlLedState {}

class ControlLedOk extends ControlLedState {
  final String msg;

  ControlLedOk(this.msg);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ControlLedOk && other.msg == msg;
  }

  @override
  int get hashCode => msg.hashCode;
}

class ControlLedError extends ControlLedState {
  final String msg;

  ControlLedError(this.msg);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ControlLedError && other.msg == msg;
  }

  @override
  int get hashCode => msg.hashCode;
}
