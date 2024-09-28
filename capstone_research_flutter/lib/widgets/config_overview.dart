import 'package:flutter/material.dart';
import 'package:capstone_research_flutter/classes/globals.dart' as globals;
import '../extensions/num.dart';
import './config_load_from_qr.dart';

class ConfigOverview {
  static Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "End Point Connection Config",
                      style: TextStyle(
                          fontSize: 14.pixelScale(context),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height: 14
                            .pixelScale(context)),
                    ConfigOverview._buildGlassSection(context),
                    SizedBox(
                        height: 14
                            .pixelScale(context)),
                    ConfigOverview._buildProcessorSection(context),
                    SizedBox(
                      height: 30
                          .pixelScale(context),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QRViewWidget()));
                      },
                      child: const Text("config.."),
                    ),
                  ],
                ))));
  }

  static Widget _buildConnectionConfigSection(String label, bool isConnected,
      List<Widget> fields, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 12.pixelScale(context)),
            ),
            SizedBox(
                width: 10
                    .pixelScale(context)),
            Icon(
              isConnected ? Icons.check : Icons.close,
              color: isConnected ? Colors.green : Colors.red,
            ),
          ],
        ),
        SizedBox(
            height:
                10.pixelScale(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: fields,
        )
      ],
    );
  }

  static Widget _buildGlassSection(BuildContext context) {
    return ConfigOverview._buildConnectionConfigSection(
        'Glass',
        true,
        [
          Flexible(
              child: TextField(
            controller: TextEditingController(text: globals.config.connectionConfig.glassConnectionConfig.address),
            decoration: const InputDecoration(
              labelText: 'address',
              border: OutlineInputBorder(),
            ),
            onChanged: (text) {
              globals.config.connectionConfig.glassConnectionConfig.address = text;
            }
          ))
        ],
        context);
  }

  static Widget _buildProcessorSection(BuildContext context) {
    return ConfigOverview._buildConnectionConfigSection(
        'Processor',
        true,
        [
          Flexible(
              child: TextField(
            controller: TextEditingController(text: globals.config.connectionConfig.processorConnectionConfig.address),
            decoration: const InputDecoration(
              labelText: 'address',
              border: OutlineInputBorder(),
            ),
            onChanged: (text) {
              globals.config.connectionConfig.processorConnectionConfig.address = text;
            }
          ))
        ],
        context);
  }
}
