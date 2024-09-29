import 'dart:convert';
import 'package:test/test.dart';
import 'package:capstone_research_flutter/classes/serializables/config.dart';
import 'package:capstone_research_flutter/classes/serializables/glass_connection_config.dart';
import 'package:capstone_research_flutter/classes/serializables/processor_connection_config.dart';

void main() {
  Config config = Config(
    connectionConfig: ConnectionConfig(
      glassConnectionConfig: GlassConnectionConfig(
        address: 'init.glassConnectionConfigAddress'
      ),
      processorConnectionConfig: ProcessorConnectionConfig(
        address: 'init.processorConnectionConfigAddress'
      )
    )
  );
  String serialized = '{"connection_config":{"glass_connection_config":{"address":"init.glassConnectionConfigAddress"},"processor_connection_config":{"address":"init.processorConnectionConfigAddress"}}}';

  test('Deserialized serialized config must be same as origin config', () {
    expect(jsonEncode(config.toJson()), serialized);
  });

  test('Check is serialized config value can be deserialized correctly', () {
    Config decoded = Config.fromJson(jsonDecode(serialized));
    expect(config.connectionConfig.glassConnectionConfig.address, decoded.connectionConfig.glassConnectionConfig.address);
    expect(config.connectionConfig.processorConnectionConfig.address, decoded.connectionConfig.processorConnectionConfig.address);
  });
}
