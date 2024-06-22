import 'package:easy_pay/src/colors.dart';
import 'package:flutter/material.dart';

class ImageTextButtonRow extends StatelessWidget {
  final VoidCallback onPressed;
  final String imagePath;
  final String text;
  final String defaultImagePath;

  ImageTextButtonRow({
    required this.onPressed,
    required this.imagePath,
    required this.text,
    this.defaultImagePath = 'assets/images/NotFound.png',
  });

  @override
  Widget build(BuildContext context) {
    bool isNetworkImage =
        imagePath.startsWith('http') || imagePath.startsWith('https');
    final Size size = MediaQuery.of(context).size;
    Widget imageWidget;
    if (isNetworkImage) {
      imageWidget = Image.network(
        imagePath,
        height: 24.0,
        width: 24.0,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            defaultImagePath,
            height: 24.0,
            width: 24.0,
          );
        },
      );
    } else {
      imageWidget = Image.asset(
        imagePath,
        height: 24.0,
        width: 24.0,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            defaultImagePath,
            height: 24.0,
            width: 24.0,
          );
        },
      );
    }

    return SizedBox(
      width: size.width, // El botón ocupa todo el ancho disponible
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            imageWidget,
            Expanded(
              child: Card(
                color: Colors.black, // Fondo negro para el texto
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0), // Color del texto blanco
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
