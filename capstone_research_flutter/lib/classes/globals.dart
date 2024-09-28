import 'package:capstone_research_flutter/classes/initializing.dart' as init;
import 'package:capstone_research_flutter/classes/serializables/config.dart';
import 'package:capstone_research_flutter/classes/serializables/glass_connection_config.dart';
import 'package:capstone_research_flutter/classes/serializables/processor_connection_config.dart';

Config config = Config(
  connectionConfig: ConnectionConfig(
    glassConnectionConfig: GlassConnectionConfig(
      address: init.glassConnectionConfigAddress
    ),
    processorConnectionConfig: ProcessorConnectionConfig(
      address: init.processorConnectionConfigAddress
    )
  )
);
