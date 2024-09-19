import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ConnectionConfigScreen(),
    );
  }
}

class ConnectionConfigScreen extends StatelessWidget {
  const ConnectionConfigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Connection Configuration")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Endpoint Connection Config",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildConnectionSection("Glass", true),
              const SizedBox(height: 20),
              _buildConnectionSection("Processor", false),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Add config action here
                },
                child: const Text("config.."),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConnectionSection(String label, bool isConnected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
        TextField(
          decoration: const InputDecoration(
            labelText: 'Field 1',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Field 2',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Field 3',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
