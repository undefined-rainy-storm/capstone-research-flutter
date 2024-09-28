import 'dart:io';
import 'package:qr/qr.dart';
import 'package:capstone_research_flutter/classes/initializing.dart' as init;
import 'package:capstone_research_flutter/classes/serializables/config.dart';
import 'package:capstone_research_flutter/classes/serializables/glass_connection_config.dart';
import 'package:capstone_research_flutter/classes/serializables/processor_connection_config.dart';

void main() {
  String serialized = Config(
    connectionConfig: ConnectionConfig(
      glassConnectionConfig: GlassConnectionConfig(address: init.glassConnectionConfigAddress),
      processorConnectionConfig: ProcessorConnectionConfig(address: init.processorConnectionConfigAddress)
    )
  ).toJson().toString();
  final qrCode = QrCode(5, QrErrorCorrectLevel.L)
    ..addData(serialized);
  final qrImage = QrImage(qrCode);
  for (var x = 0; x < qrImage.moduleCount; x++) {
    for (var y = 0; y < qrImage.moduleCount; y++) {
      stdout.write(qrImage.isDark(y, x) ? '██' : '  ');
    }
    print('');
  }
}
