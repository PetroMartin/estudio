// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_pay/src/core/form_validator.dart';
import 'package:easy_pay/src/core/widgets/text_field/login_text_field.dart';
import 'package:easy_pay/src/home/views/home_view.dart';
import 'package:easy_pay/src/login/models/user_model.dart';
import 'package:easy_pay/src/login/controller/auth_service.dart';
import 'package:easy_pay/src/login/views/olvido_su_contrasenha_view.dart';
import 'package:easy_pay/src/login/views/register_view.dart';
import 'package:easy_pay/src/sample_feature/sample_item.dart';
import 'package:easy_pay/src/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importar el paquete url_launcher

/// Displays a list of SampleItems.
class LoginView extends StatelessWidget {
  const LoginView({
    Key? key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  }) : super(key: key);

  static const routeName = '/';

  final List<SampleItem> items;
  static ValueNotifier<bool> _obscureTextNotifier = ValueNotifier<bool>(true);

  void _toggleObscureText() {
    _obscureTextNotifier.value = !_obscureTextNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController correoController = TextEditingController();
    final TextEditingController contrasenhaController = TextEditingController();
    final AuthService authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesion'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      /*body: Center(
        child: InkWell( // Envolver la imagen con InkWell para detectar toques
          onTap: () async { // Función a ejecutar cuando se toca la imagen
            final url = Uri.parse('https://www.facebook.com/easypay.bo'); // URL a abrir
            if (await canLaunchUrl(url)) { // Verificar si se puede abrir la URL
              await launchUrl(url); // Abrir la URL
            } else {
              throw 'No se pudo abrir $url'; // Lanzar una excepción si no se puede abrir la URL
            }
          },
          child: Image.asset('assets/images/easy_pay.png'), // La imagen
        ),
      ),*/
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: InkWell(
                onTap: () async {
                  final url = Uri.parse('https://www.facebook.com/easypay.bo');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'No se pudo abrir $url';
                  }
                },
                child: Image.asset('assets/images/easy_pay.png'),
              ),
            ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 4.0), // Padding específico para el TextField

                  child: LoginTextField(
                    controller: correoController,
                    labelText: 'Usuario',
                    hintText: 'Escriba su usuario',
                    validator: FormValidator.validateProductName,
                    prefixIcon: Icons.text_fields,
                  )),
            ),
            Center(
              child: ValueListenableBuilder(
                valueListenable: _obscureTextNotifier,
                builder: (context, obscureText, child) {
                  return LoginTextField(
                    controller: contrasenhaController,
                    labelText: 'Contraseña',
                    hintText: 'Ingrese su contraseña',
                    validator: FormValidator.validatePassword,
                    prefixIcon: Icons.lock,
                    obscureText: obscureText,
                    onToggleVisibility: _toggleObscureText,
                    isPassword: true,
                  );
                },
              ),
            ),

            // Por ejemplo, un botón
            Center(
              child: ElevatedButton(
                onPressed: () {
                  /*  UserModel persona = UserModel(
                      username: correoController.text,
                      password: contrasenhaController.text);
                  authService.login(context, persona);*/
                  Navigator.restorablePushNamed(context, HomeView.routeName);
                },
                child: Text('Login'),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  // Acción del botón
                  Navigator.restorablePushNamed(
                      context, OlvidoSuContrasenhaView.routeName);
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal:
                          20.0), // Padding del botón // Estilo del texto
                ),
                child: Text('¿Olvido su contraseña?'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.restorablePushNamed(
                      context, RegisterView.routeName);
                },
                child: Text('Crear cuenta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
