import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sensorsinfos/cubit/sensor_data_cubit.dart';
import 'package:sensorsinfos/page/display_page.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key, required this.title});

  final String title;

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  final _formKey = GlobalKey<FormState>();
  late String ip;
  late String port;
  // late String apiKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              form(),
            ],
          ),
        ),
      ),
    );
  }

  Form form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          paddingFor(
            // ip address input field
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
              onChanged: (value) {
                debugPrint('============== ip : $value');
                ip = value.trim();
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'adresse IP',
                hintText: 'saisir l\'adresse IP',
              ),
              validator: (value) {
                if (value!.isEmpty || value!.trim().isEmpty) {
                  return 'veuillez entrer l\'adresse IP';
                }
                return null;
              },
            ), 10, 10, 10, 10
          ),
          paddingFor(
            // port input field
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: false),
              onChanged: (value) {
                debugPrint('============== port : $value');
                port = value.trim();
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'n° de port',
                hintText: 'saisir le n° de port',
              ),
              validator: (value) {
                if (value!.isEmpty || value!.trim().isEmpty) {
                  return 'Veuillez entrer le n° de port';
                }
                return null;
              },
            ), 10, 10, 10, 10
          ),
          // paddingFor(
          //   // api key input field
          //   TextFormField(
          //     onChanged: (value) {
          //       debugPrint('============== apiKey : $value');
          //       apiKey = value.trim();
          //     },
          //     decoration: const InputDecoration(
          //       border: OutlineInputBorder(),
          //       labelText: 'clé d\'API',
          //       hintText: 'saisir la clé API',
          //     ),
          //     validator: (value) {
          //       if (value!.isEmpty || value!.trim().isEmpty) {
          //         return 'Veuillez entrer la clé API';
          //       }
          //       return null;
          //     },
          //   ), 10, 10, 10, 10
          // ),
          paddingFor(
            // connexion
            OutlinedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  debugPrint("Formulaire valide");
                  BlocProvider.of<SensorDataCubit>(context).getSensorData(ip, port);
                  var route = MaterialPageRoute(
                    maintainState: false,
                    builder: (context) => DisplayPage(),
                    settings: RouteSettings(
                      arguments: {
                        "ip": ip,
                        "port": port
                      },
                    ),
                  );
                  Navigator.push(context, route);
                }
                else {
                  Fluttertoast.showToast(
                    msg: "formulaire invalide",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
                debugPrint("Configurer le bouton de connexion");
              },
              child: const Text('Se Connecter'),
            ), 10, 10, 10, 10
          ),
        ],
      ),
    );
  }

  Padding paddingFor(Widget widget, double l, double t, double r, double b) {
    return Padding(
      padding: EdgeInsets.fromLTRB(l, t, r, b),
      child: widget,
    );
  }
}