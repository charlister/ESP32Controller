import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensorsinfos/cubit/control_led_cubit.dart';

class LedControllerCard extends StatefulWidget {
  String ip = "";
  String port = "";

  LedControllerCard({required this.ip, required this.port});

  @override
  State<LedControllerCard> createState() => _LedControllerCardState();
}

class _LedControllerCardState extends State<LedControllerCard> {
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "Contrôler une led : "
            ),
            const SizedBox(
              height: 15,
            ),
            Slider(
              value: _sliderValue,
              min: 0,
              max: 255,
              onChanged: (double newValue) {
                setState(() {
                  _sliderValue = newValue;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint("ip .......... ${widget.ip}");
                debugPrint("port .......... ${widget.port}");
                BlocProvider.of<ControlLedCubit>(context).controlCmdForLed(widget.ip, widget.port, _sliderValue.toInt().toString());
              },
              child: const Text('envoyer'),
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<ControlLedCubit, ControlLedState>(
                builder: (context, state) {
                  if(state is ControlLedInitial) {
                    return const Text(
                        "la led est éteinte !"
                    );
                  }
                  else if(state is ControlLedLoading) {
                    return const CircularProgressIndicator(
                      strokeWidth: 5.0,
                    );
                  }
                  else if(state is ControlLedOk) {
                    return  Text(
                        state.msg
                    );
                  }
                  else if (state is ControlLedError) {
                    return  Text(
                        state.msg
                    );
                  }
                  else {
                    return const Text(
                        "..."
                    );
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}