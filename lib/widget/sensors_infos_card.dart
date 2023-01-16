import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensorsinfos/cubit/sensor_infos_cubit.dart';

class SensorsInfosCard extends StatefulWidget {
  String ip = "";
  String port = "";

  SensorsInfosCard({required this.ip, required this.port});

  @override
  State<SensorsInfosCard> createState() => _SensorsInfosCardState();
}

class _SensorsInfosCardState extends State<SensorsInfosCard> {
  late String infos;
  List<String> listInfos = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Liste des capteurs',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<SensorInfosCubit, SensorInfosState>(
                builder: (context, state) {
                  if(state is SensorInfosInitial) {
                    BlocProvider.of<SensorInfosCubit>(context).getSensorInfo(widget.ip, widget.port);
                    return Container();
                  }
                  else if(state is SensorInfosLoading) {
                    return const CircularProgressIndicator(
                      strokeWidth: 5.0,
                    );
                  }
                  else if(state is SensorInfosLoaded) {
                    return sensors(state.infos);
                  }
                  else if (state is SensorInfosError) {
                    return  Text(
                        state.message
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
  
  Column sensors(String infos) {
    List<String> listInfos = infos.split(";");
    List<Text> listText = [];
    for(var info in listInfos) {
      listText.add(
        Text(
          '\t- $info',
          style: Theme.of(context).textTheme.subtitle1,
        )
      );
    }
    return Column(
      children: listText,
    );
  }
}