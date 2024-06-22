import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToApp();
  }

  void navigateToApp() {
    Future.delayed(const Duration(seconds: 4)).then((_) {
      Navigator.of(context).pushReplacementNamed('/app');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/easy_pay.png'), // Reemplaza 'assets/images/easy_pay.png' con la ruta de tu logo
            const SizedBox(height: 16.0),
            const CircularProgressIndicator(), // Indicador de carga
          ],
        ),
      ),
    );
  }
}