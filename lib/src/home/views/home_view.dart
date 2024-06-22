import 'package:easy_pay/src/core/widgets/base/footer.dart';
import 'package:easy_pay/src/core/widgets/image_text/image_text_button.dart';
import 'package:easy_pay/src/core/widgets/image_text/image_text_button_row.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController correoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: size.width / 3,
                  height: size.width / 3,
                  child: Image.asset('assets/images/easy_pay.png'),
                ),
              ),
              SizedBox(height: 5),
              ImageTextButtonRow(
                onPressed: () {
                  print("easy_pay Pressed");
                },
                imagePath:
                    'assets/images/easy_pay.png', // Ruta de la imagen local
                text: 'pago con QR',
              ),
              SizedBox(height: 5),
              ImageTextButtonRow(
                onPressed: () {
                  print("flutter_logo Pressed");
                },
                imagePath:
                    'https://images.pexels.com/photos/20741814/pexels-photo-20741814/free-photo-of-paisaje-mujer-flores-campo.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Ruta de la imagen local
                text: 'Pago de servicio',
              ),
              SizedBox(height: 5),
              ImageTextButtonRow(
                onPressed: () {
                  print("flutter_logo Pressed");
                },
                imagePath:
                    'assets/images/flutter_logo.png', // Ruta de la imagen local
                text: 'Cajero automático',
              ),
              SizedBox(height: 5),
              ImageTextButtonRow(
                onPressed: () {
                  print("puntos");
                },
                imagePath:
                    'assets/images/flutter_logo.png', // Ruta de la imagen local
                text: 'puntos',
              ),
              SizedBox(height: 5),
              ImageTextButtonRow(
                onPressed: () {
                  print("puntos");
                },
                imagePath:
                    'assets/images/flutter_logo.png', // Ruta de la imagen local
                text: 'Control consumo',
              ),
              ImageTextButtonRow(
                onPressed: () {
                  print("puntos");
                },
                imagePath:
                    'assets/images/flutter_logo.png', // Ruta de la imagen local
                text: 'Estaciones de servicio',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(boton: 'inicio'),
    );
  }
}
