class GlassConnectionConfig {
  final String address;

  GlassConnectionConfig(this.address);

  GlassConnectionConfig.fromJson(Map<String, dynamic> json)
      : address = json['address'] as String;

  Map<String, dynamic> toJson() => {'address': address};
}
