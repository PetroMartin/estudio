import 'package:easy_pay/src/core/form_validator.dart';
import 'package:easy_pay/src/core/widgets/text_field/login_text_field.dart';
import 'package:easy_pay/src/login/models/user_model.dart';
import 'package:easy_pay/src/login/controller/auth_service.dart';
import 'package:easy_pay/src/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const routeName = '/registrarse';

  @override
  Widget build(BuildContext context) {
    final TextEditingController nombreController = TextEditingController();
    final TextEditingController apellidoController = TextEditingController();
    final TextEditingController telefonoController = TextEditingController();
    final TextEditingController correoController = TextEditingController();
    final TextEditingController contrasenhaController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final AuthService authService = AuthService();
    final ValueNotifier<bool> _obscureTextNotifier = ValueNotifier<bool>(true);

    void _toggleObscureText() {
      _obscureTextNotifier.value = !_obscureTextNotifier.value;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          //padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              LoginTextField(
                controller: nombreController,
                labelText: 'Nombre',
                hintText: 'Escriba su nombre',
                validator: FormValidator.validateProductName,
                prefixIcon: Icons.text_fields,
              ),
              SizedBox(height: 16),

              LoginTextField(
                controller: apellidoController,
                labelText: 'Apellido',
                hintText: 'Escriba su apellido',
                validator: FormValidator.validateProductName,
                prefixIcon: Icons.text_fields,
              ),
              SizedBox(height: 16),

              LoginTextField(
                controller: telefonoController,
                labelText: 'Número de Celular',
                hintText: 'Escriba su Celular',
                validator: FormValidator.validatePhoneNumber,
                prefixIcon: Icons.text_fields,
                keyboardType: TextInputType.phone,
              ),

              //  keyboardType: TextInputType.phone,

              SizedBox(height: 16),

              LoginTextField(
                controller: correoController,
                labelText: 'Correo Electrónico',
                hintText: 'Escriba su correo',
                validator: FormValidator.validateEmail,
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),

              ValueListenableBuilder(
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
              SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  // Aquí puedes añadir la lógica para manejar el registro
                  UserModel newPersona = UserModel(
                    id: 1, // Puedes cambiar esto por un valor dinámico
                    username: nombreController
                        .text, // Cambia esto por los datos que desees
                    password: contrasenhaController
                        .text, // Cambia esto por los datos que desees
                  );
                  authService.createPersona(context, newPersona);
                  print('Nombre: ${nombreController.text}');
                  print('Apellido: ${apellidoController.text}');
                  print('Número de Celular: ${telefonoController.text}');
                  print('Correo Electrónico: ${correoController.text}');
                  print('Contraseña: ${contrasenhaController.text}');
                },
                child: Text('Crear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
