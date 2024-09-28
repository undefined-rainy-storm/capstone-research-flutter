class GlassConnectionConfig {
  String address;

  GlassConnectionConfig({required this.address});

  GlassConnectionConfig.fromJson(Map<String, dynamic> json)
      : address = json['address'] as String;

  Map<String, dynamic> toJson() => {'address': address};
}
