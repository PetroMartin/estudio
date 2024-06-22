import 'package:easy_pay/src/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OlvidoSuContrasenhaView extends StatelessWidget {
  const OlvidoSuContrasenhaView({super.key});
  static const routeName = '/olvidosucontrasenha';

  @override
  Widget build(BuildContext context) {
    final TextEditingController correoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Olvido su contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: correoController,
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes añadir la lógica para manejar el registro
                print('Correo Electrónico: ${correoController.text}');
              },
              child: Text('añadir'),
            ),
          ],
        ),
      ),
    );
  }
}
