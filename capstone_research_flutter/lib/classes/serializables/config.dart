import 'package:capstone_research_flutter/classes/serializables/glass_connection_config.dart';
import 'package:capstone_research_flutter/classes/serializables/processor_connection_config.dart';

class Config {
  final ConnectionConfig connectionConfig;

  Config({
    required this.connectionConfig,
  });

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      connectionConfig: ConnectionConfig.fromJson(json['connection_config']),
    );
  }

  Map<String, dynamic> toJson() => {
        'connection_config': connectionConfig.toJson(),
      };
}

class ConnectionConfig {
  final GlassConnectionConfig glassConnectionConfig;
  final ProcessorConnectionConfig processorConnectionConfig;

  ConnectionConfig({
    required this.glassConnectionConfig,
    required this.processorConnectionConfig,
  });

  factory ConnectionConfig.fromJson(Map<String, dynamic> json) {
    return ConnectionConfig(
      glassConnectionConfig:
          GlassConnectionConfig.fromJson(json['glass_connection_config']),
      processorConnectionConfig: ProcessorConnectionConfig.fromJson(
          json['processor_connection_config']),
    );
  }

  Map<String, dynamic> toJson() => {
        'glass_connection_config': glassConnectionConfig.toJson(),
        'processor_connection_config': processorConnectionConfig.toJson(),
      };
}
