import 'dart:convert';
import 'package:test/test.dart';
import 'package:capstone_research_flutter/classes/serializables/config.dart';
import 'package:capstone_research_flutter/classes/serializables/glass_connection_config.dart';
import 'package:capstone_research_flutter/classes/serializables/processor_connection_config.dart';

void main() {
  test('Deserialized serialized config must be same as origin config', () {
    Config config = Config(
      connectionConfig: ConnectionConfig(
        glassConnectionConfig: GlassConnectionConfig(
          address: 'GlassConnectionConfigTest'
        ),
        processorConnectionConfig: ProcessorConnectionConfig(
          address: 'ProcessorConnectionConfigTest'
        )
      )
    );
    Config deserializedSerializedConfig = Config.fromJson(config.toJson());

    expect(config.toJson(), deserializedSerializedConfig.toJson());
  });
  try {
    Config.fromJson(json.decode('{"undefined": "undefined"}'));
  } on TypeError {
    print(1);
  }
}
