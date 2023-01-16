import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensorsinfos/cubit/control_led_cubit.dart';
import 'package:sensorsinfos/cubit/sensor_data_cubit.dart';
import 'package:sensorsinfos/widget/led_controller_card.dart';
import 'package:sensorsinfos/widget/lighting_card.dart';
import 'package:sensorsinfos/widget/sensors_infos_card.dart';
import 'package:sensorsinfos/widget/temperature_card.dart';

class DisplayPage extends StatefulWidget{

  DisplayPage({super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  double _sliderValue = 0;
  String _ip = "";
  String _port = "";

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _ip = routeArgs['ip'];
    _port = routeArgs['port'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sensor Infos"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<SensorDataCubit, SensorDataState>(
              // bloc: BlocProvider.of<SensorCubit>(context),
              builder: (context, state) {
                if (state is SensorDataInitial) {
                  debugPrint("initial");
                  return const Text("initial");
                }
                else if (state is SensorDataLoading) {
                  debugPrint("loading");
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 5.0,
                    ),
                  );
                }
                else if (state is SensorDataLoaded) {
                  debugPrint("loaded");
                  return Column(
                      children: [
                        _dataViewer(
                          state.sensorModel!.thermistor!.temperature!,
                          state.sensorModel!.thermistor!.temperatureDesc!,
                          state.sensorModel!.photoresistor!.lightLevelDesc!,
                        ),
                        SizedBox(height: 16.0),
                        LedControllerCard(ip: _ip, port: _port),
                        SizedBox(height: 16.0),
                        SensorsInfosCard(ip: _ip, port: _port),
                      ]
                  );
                }
                else {
                  debugPrint("error");
                  return const Center(
                    child: Text(
                      "Aucune donnée reçue !",
                    ),
                  );
                }
              },
            ),

          ],
        ),
      )
    );
  }

  Column _dataViewer(num temperature, String tempDescription, String lightingDesc) {
    return Column(
      children: [
        TemperatureCard(temperature: temperature.toInt(), tempDescription: tempDescription),
        SizedBox(height: 16.0),
        LightingCard(lightingDesc: lightingDesc),
      ],
    );
  }

  Column _ledController() {
    return Column(
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
            debugPrint("ip .......... $_ip");
            debugPrint("port .......... $_port");
            BlocProvider.of<ControlLedCubit>(context).controlCmdForLed(_ip, _port, _sliderValue.toInt().toString());
          },
          child: const Text('envoyer'),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}