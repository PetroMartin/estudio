import 'dart:io';
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_tools/qr_code_tools.dart';

class ScanerarQRView extends StatefulWidget {
  const ScanerarQRView({super.key});
  static const routeName = '/scanearqr';

  @override
  State<ScanerarQRView> createState() => _ScanerarQRViewState();
}

class _ScanerarQRViewState extends State<ScanerarQRView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  final ImagePicker _picker = ImagePicker();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter QR Scanner'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: _pickImageFromGallery,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _pickImageFromCamera,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text('Código encontrado: ${result!.code}')
                  : Text('Escanea un código QR'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print('Imagen seleccionada desde galería: ${image.path}');
      try {
        final code = await QrCodeToolsPlugin.decodeFrom(image.path);
        print('Código QR decodificado: $code');
        setState(() {
          result = Barcode(code, BarcodeFormat.qrcode, []);
        });
      } catch (e) {
        print('Error al decodificar QR: $e');
        setState(() {
          result = null;
        });
      }
    } else {
      print('No se seleccionó ninguna imagen');
    }
  }

  Future<void> _pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print('Imagen capturada desde cámara: ${image.path}');
      try {
        final code = await QrCodeToolsPlugin.decodeFrom(image.path);
        print('Código QR decodificado: $code');
        setState(() {
          result = Barcode(code, BarcodeFormat.qrcode, []);
        });
      } catch (e) {
        print('Error al decodificar QR: $e');
        setState(() {
          result = null;
        });
      }
    } else {
      print('No se capturó ninguna imagen');
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
