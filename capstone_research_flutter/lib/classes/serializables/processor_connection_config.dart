class ProcessorConnectionConfig {
  final String address;

  ProcessorConnectionConfig(this.address);

  ProcessorConnectionConfig.fromJson(Map<String, dynamic> json)
      : address = json['address'] as String;

  Map<String, dynamic> toJson() => {'address': address};
}
