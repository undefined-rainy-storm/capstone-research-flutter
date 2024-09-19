import 'package:flutter/material.dart';

class ConfigOverview {
  static Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "End Point Connection Config",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    ConfigOverview._buildGlassSection(),
                    const SizedBox(height: 20),
                    ConfigOverview._buildProcessorSection()
                  ],
                ))));
  }

  static Widget _buildConnectionConfigSection(
      String label, bool isConnected, List<Widget> fields) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 10),
            Icon(
              isConnected ? Icons.check : Icons.close,
              color: isConnected ? Colors.green : Colors.red,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: fields,
        )
      ],
    );
  }

  static Widget _buildGlassSection() {
    return ConfigOverview._buildConnectionConfigSection('Glass', true, [
      /*const TextField(
        decoration: InputDecoration(
          labelText: 'address',
          border: OutlineInputBorder(),
        ),
      )*/
    ]);
  }

  static Widget _buildProcessorSection() {
    return ConfigOverview._buildConnectionConfigSection('Processor', true, [
      /*const TextField(
        decoration: InputDecoration(
          labelText: 'address',
          border: OutlineInputBorder(),
        ),
      )*/
    ]);
  }
}
