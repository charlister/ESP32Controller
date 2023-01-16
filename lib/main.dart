import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensorsinfos/cubit/control_led_cubit.dart';
import 'package:sensorsinfos/cubit/sensor_data_cubit.dart';
import 'package:sensorsinfos/cubit/sensor_infos_cubit.dart';
import 'package:sensorsinfos/page/connexion_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensor Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => SensorDataCubit(),),
          BlocProvider(create: (BuildContext context) => SensorInfosCubit(),),
          BlocProvider(create: (BuildContext context) => ControlLedCubit(),),
        ],
        child: BlocBuilder<SensorDataCubit, SensorDataState>(
          buildWhen: (previous, current) => true,
          builder: (context, state) {
            return MaterialApp(
              home: ConnexionPage(title: 'Connexion Sensor API'),
            );
          },
        ),
      ),
    );
  }
}