import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sensorsinfos/service/control_led_service.dart';

part 'control_led_state.dart';

class ControlLedCubit extends Cubit<ControlLedState> {
  ControlLedCubit() : super(ControlLedInitial());

  Future<void> controlCmdForLed(String ip, String port, String cmd) async {
    ControlLedLoading();
    try {
      final result = await ControlLedService.setCmdLedValue(ip: ip, port: port, cmd: cmd);
      emit(ControlLedOk(result));
    } on Exception {
      emit(ControlLedError("Erreur de réception des données."));
    }
  }
}
