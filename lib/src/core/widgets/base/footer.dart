import 'package:easy_pay/src/core/widgets/image_text/icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Footer extends StatelessWidget {
  String boton;

  Footer({required this.boton});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> botonNotifier = ValueNotifier<String>(boton);
    void cambiarFooter(String btn) {
      botonNotifier.value = btn;
    }

    return BottomAppBar(
      child: ValueListenableBuilder(
        valueListenable: botonNotifier,
        builder: (context, nameText, child) {
          return Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: <Widget>[
              IconButtonWithText(
                icon: Icons.home,
                text: "Inicio",
                isActive: (nameText == "inicio"),
                onPressed: () {
                  // Acción para el botón de perfil
                  cambiarFooter("inicio");
                },
              ),
              IconButtonWithText(
                icon: Icons.notifications_active,
                text: "Notificaciones",
                isActive: (nameText == "notify"),
                onPressed: () {
                  // Acción para el botón de perfil
                  cambiarFooter("notify");
                },
              ),
              IconButtonWithText(
                icon: Icons.settings_outlined,
                text: "Configuración",
                isActive: (nameText == "settings"),
                onPressed: () {
                  // Acción para el botón de perfil
                  cambiarFooter("settings");
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
