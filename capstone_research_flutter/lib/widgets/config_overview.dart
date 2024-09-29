import 'package:flutter/material.dart';
import 'package:capstone_research_flutter/classes/globals.dart' as globals;
import '../extensions/num.dart';
import './config_load_from_qr.dart';

class ConfigOverview {
  static Widget build(BuildContext context) {
    return const ConfigOverviewWidget();
  }
}

class ConfigOverviewWidget extends StatefulWidget {
  const ConfigOverviewWidget({super.key});
  
  @override
  _ConfigOverviewState createState() => _ConfigOverviewState();
}

class _ConfigOverviewState extends State<ConfigOverviewWidget> {
  @override build(BuildContext context) {
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
                    _buildGlassSection(context),
                    SizedBox(
                        height: 14
                            .pixelScale(context)),
                    _buildProcessorSection(context),
                    SizedBox(
                      height: 30
                          .pixelScale(context),
                    ),
                    ElevatedButton(
                      onPressed: () {_navigateAndDisplayQRViewWidget(context);},
                      child: const Text("config.."),
                    ),
                  ],
                ))));
  }

  Future<void> _navigateAndDisplayQRViewWidget(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QRViewWidget()),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!context.mounted) return;

    _updateTextField();
  }

  void _updateTextField() {
    _controllerGlassConnectionConfigAddress.text = globals.config.connectionConfig.glassConnectionConfig.address;
    _controllerProcessorConnectionConfigAddress.text = globals.config.connectionConfig.processorConnectionConfig.address;
  }

  Widget _buildConnectionConfigSection(String label, bool isConnected,
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

  final TextEditingController _controllerGlassConnectionConfigAddress = TextEditingController(text: globals.config.connectionConfig.glassConnectionConfig.address);
  Widget _buildGlassSection(BuildContext context) {
    return _buildConnectionConfigSection(
        'Glass',
        true,
        [
          Flexible(child: TextField(
            controller: _controllerGlassConnectionConfigAddress,
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

  final TextEditingController _controllerProcessorConnectionConfigAddress = TextEditingController(text: globals.config.connectionConfig.processorConnectionConfig.address);
  Widget _buildProcessorSection(BuildContext context) {
    return _buildConnectionConfigSection(
        'Processor',
        true,
        [
          Flexible(child: TextField(
            controller: _controllerProcessorConnectionConfigAddress,
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
