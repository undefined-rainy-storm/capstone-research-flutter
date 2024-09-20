import 'package:flutter/material.dart';
import '../extensions/num.dart';

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
                            .pixelScale(context)
                            .addSpacingOnKeyboardVisible(context)),
                    ConfigOverview._buildGlassSection(context),
                    SizedBox(
                        height: 14
                            .pixelScale(context)
                            .addSpacingOnKeyboardVisible(context)),
                    ConfigOverview._buildProcessorSection(context),
                    SizedBox(
                      height: 30
                          .pixelScale(context)
                          .addSpacingOnKeyboardVisible(context),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add config action here
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
                    .pixelScale(context)
                    .addSpacingOnKeyboardVisible(context)),
            Icon(
              isConnected ? Icons.check : Icons.close,
              color: isConnected ? Colors.green : Colors.red,
            ),
          ],
        ),
        SizedBox(
            height:
                10.pixelScale(context).addSpacingOnKeyboardVisible(context)),
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
          const Flexible(
              child: TextField(
            decoration: InputDecoration(
              labelText: 'address',
              border: OutlineInputBorder(),
            ),
          ))
        ],
        context);
  }

  static Widget _buildProcessorSection(BuildContext context) {
    return ConfigOverview._buildConnectionConfigSection(
        'Processor',
        true,
        [
          const Flexible(
              child: TextField(
            decoration: InputDecoration(
              labelText: 'address',
              border: OutlineInputBorder(),
            ),
          ))
        ],
        context);
  }
}
