import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sensorsinfos/widget/circle.dart';

class LightingCard extends StatelessWidget {
  final String lightingDesc;

  LightingCard({required this.lightingDesc});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                getLightingIcon(lightingDesc: lightingDesc),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Luminosité ambiante',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                const Icon(
                  FontAwesomeIcons.circleInfo,
                  color: Colors.brown,
                  size: 30,
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        getLightingDesc(lightingDesc: lightingDesc),
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

  Container getLightingIcon({required String lightingDesc}) {
    Container result;
    switch(lightingDesc) {
      case "DARK":
        result = Circle.circle(30, 30, Colors.black);
        break;
      case "LOW":
        result = Circle.circle(30, 30, Colors.deepOrange.shade50);
        break;
      case "BRIGHT":
        result = Circle.circle(30, 30, Colors.deepOrange.shade200);
        break;
      case "VERY_BRIGHT":
        result = Circle.circle(30, 30, Colors.deepOrange);
        break;
      case "UNDEFINED":
        result = Circle.circle(30, 30, Colors.grey);
        break;
      default:
        result = Circle.circle(30, 30, Colors.grey);
        break;
    }
    return result;
  }

  String getLightingDesc({required lightingDesc}) {
    String result;
    switch(lightingDesc) {
      case "DARK":
        result = "sombre";
        break;
      case "LOW":
        result = "faiblement éclairé";
        break;
      case "BRIGHT":
        result = "éclairé";
        break;
      case "VERY_BRIGHT":
        result = "très éclairé";
        break;
      default:
        result = "indéterminé";
        break;
    }
    return result;
  }
}