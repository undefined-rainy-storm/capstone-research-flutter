import 'dart:convert';

import 'package:capstone_research_flutter/classes/serializables/config.dart';
import 'package:capstone_research_flutter/classes/globals.dart' as globals;
import 'package:capstone_research_flutter/extensions/num.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ConfigLoadFromQR {
  static Widget build(BuildContext context) {
    return const QRViewWidget();
  }
}

class QRViewWidget extends StatefulWidget {
  const QRViewWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QRViewState createState() => _QRViewState();
}

class _QRViewState extends State<QRViewWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            // Navigate back to the previous page
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(
              left: 15.pixelScale(context).addSpacingOnKeyboardVisible(context),
              top: 10.pixelScale(context).addSpacingOnKeyboardVisible(context),
              bottom:
                  10.pixelScale(context).addSpacingOnKeyboardVisible(context),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 14
                      .pixelScale(context)
                      .addSpacingOnKeyboardVisible(context),
                ),
                SizedBox(
                    width: 4.pixelScale(context).addSpacingOnKeyboardVisible(
                        context)), // Add spacing between the icon and text
                Text('Back'),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: QRView(
            key: qrKey,
            onQRViewCreated: (controller) => _onQRViewCreated(controller, context),
          ),
        ),
        Expanded(
            flex: 1,
            child: Center(
                child: Text(
              qrText != null ? 'QR Code Result: $qrText' : 'Scan a code',
              style: TextStyle(
                  fontSize: 10
                      .pixelScale(context)
                      .addSpacingOnKeyboardVisible(context)),
            )))
      ],
    ));
  }

  void _onQRViewCreated(QRViewController controller, BuildContext context) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData.code;
      });
      if (scanData.code.runtimeType != String) return;
      
      try {
        globals.config = Config.fromJson(jsonDecode(scanData.code!));
      } on TypeError {
        return;
      }
      
      if (context.mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
