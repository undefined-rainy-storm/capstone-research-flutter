class ProcessorConnectionConfig {
  String address;

  ProcessorConnectionConfig({required this.address});

  ProcessorConnectionConfig.fromJson(Map<String, dynamic> json)
      : address = json['address'] as String;

  Map<String, dynamic> toJson() => {'address': address};
}
