import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SinConeccionDialog extends StatelessWidget {
  const SinConeccionDialog({Key? key}) : super(key: key);

  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isConnected(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mientras se espera el resultado de la conexión
          return AlertDialog(
            title: const Text("Comprobando conexión..."),
            content: const CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          // Si ocurre un error al verificar la conexión
          return AlertDialog(
            title: const Text("Error de conexión"),
            content: const Text('Ocurrió un error al verificar la conexión.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          );
        } else {
          // Mostrar el diálogo basado en el estado de la conexión
          bool isConnected = snapshot.data ?? false;
          return AlertDialog(
            title: const Text("Error de conexión"),
            content: Text(
              isConnected
                  ? 'No se puede conectar al servidor. Revise su conexión a internet.'
                  : 'No se puede conectar al servidor. Reintentelo.',
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          );
        }
      },
    );
  }
}
