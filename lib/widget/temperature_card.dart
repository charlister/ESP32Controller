import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TemperatureCard extends StatelessWidget {
  final num temperature;
  final String tempDescription;

  TemperatureCard({required this.temperature, required this.tempDescription});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                getTempIcon(tempDesc: tempDescription, color: Colors.blue, size: 30),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Température ambiante',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        '$temperature °C',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                const Icon(
                  FontAwesomeIcons.circleInfo,
                  color: Colors.brown,
                  size: 30,
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        getTemDesc(tempDesc: tempDescription),
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getTempIcon({required String tempDesc, required Color color, required double size}) {
    Icon result;
    switch(tempDesc) {
      case "CHAUD":
        result = Icon(FontAwesomeIcons.temperatureFull, color: color, size: size,);
        break;
      case "TEMPERE":
        result = Icon(FontAwesomeIcons.temperatureThreeQuarters, color: color, size: size,);
        break;
      case "FRAIS":
        result = Icon(FontAwesomeIcons.temperatureHalf, color: color, size: size,);
        break;
      case "FROID":
        result = Icon(FontAwesomeIcons.temperatureQuarter, color: color, size: size,);
        break;
      case "TRES_FROID":
        result = Icon(FontAwesomeIcons.temperatureEmpty, color: color, size: size,);
        break;
      default:
        result = Icon(FontAwesomeIcons.thermometer, color: color, size: size,);
        break;
    }
    return result;
  }

  String getTemDesc({required tempDesc}) {
    String result;
    switch(tempDesc) {
      case "CHAUD":
        result = "chaud";
        break;
      case "TEMPERE":
        result = "tempéré";
        break;
      case "FRAIS":
        result = "frais";
        break;
      case "FROID":
        result = "froid";
        break;
      case "TRES_FROID":
        result = "très froid";
        break;
      default:
        result = "indéterminé";
        break;
    }
    return result;
  }
}