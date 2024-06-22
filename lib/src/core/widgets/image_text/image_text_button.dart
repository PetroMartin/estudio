import 'package:flutter/material.dart';

class ImageTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String imagePath;
  final String text;
  final String defaultImagePath;

  ImageTextButton({
    required this.onPressed,
    required this.imagePath,
    required this.text,
    this.defaultImagePath =
        'assets/images/NotFound.png', // Ruta de la imagen por defecto
  });

  @override
  Widget build(BuildContext context) {
    bool isNetworkImage =
        imagePath.startsWith('http') || imagePath.startsWith('https');

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
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          imageWidget,
          SizedBox(width: 8.0),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
