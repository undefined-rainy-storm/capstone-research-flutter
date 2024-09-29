import 'dart:io';
import 'dart:convert';
import 'package:qr/qr.dart';
import 'package:capstone_research_flutter/classes/initializing.dart' as init;
import 'package:capstone_research_flutter/classes/serializables/config.dart';
import 'package:capstone_research_flutter/classes/serializables/glass_connection_config.dart';
import 'package:capstone_research_flutter/classes/serializables/processor_connection_config.dart';

const int configMargin = 4;
const int configMarginX = configMargin;
const int configMarginY = configMargin ~/ 2;

void main() {
  String serialized = jsonEncode(Config(
    connectionConfig: ConnectionConfig(
      glassConnectionConfig: GlassConnectionConfig(address: init.glassConnectionConfigAddress),
      processorConnectionConfig: ProcessorConnectionConfig(address: init.processorConnectionConfigAddress)
    )
  ).toJson());
  
  final qrCode = QrCode(6, QrErrorCorrectLevel.L)
    ..addData(serialized);
  final qrImage = QrImage(qrCode);

  int textWidth = qrImage.moduleCount;
  int textHeight = qrImage.moduleCount ~/ 2 + qrImage.moduleCount % 2;
  print('');
  // margin
  for (var my = 0; my < configMarginY; my++) {
    for (var mx = 0; mx < textWidth + configMarginX * 2; mx++) {
      stdout.write('█');
    }
    print('');
  }

  for (var y = 0; y < textHeight; y++) {
    // margin
    for (var mx = 0; mx < configMarginX; mx++) {
      stdout.write('█');
    }

    // content
    for (var x = 0; x < textWidth; x++) {
      if (y * 2 + 1 < qrImage.moduleCount) {
        stdout.write(
          qrImage.isDark(y * 2, x) ? (
            qrImage.isDark(y * 2 + 1, x) ? ' ' : '▄'
          ) : (
            qrImage.isDark(y * 2 + 1, x) ? '▀' : '█'
          )
        );
      } else {
        stdout.write(qrImage.isDark(y * 2, x) ? '▄' : '█');
      }
    }

    // margin
    for (var mx = 0; mx < configMarginX; mx++) {
      stdout.write('█');
    }
    print('');
  }

  // margin
  for (var my = 0; my < configMarginY; my++) {
    for (var mx = 0; mx < textWidth + configMarginX * 2; mx++) {
      stdout.write('█');
    }
    print('');
  }
}