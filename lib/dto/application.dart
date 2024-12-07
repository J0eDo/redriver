import 'package:json_annotation/json_annotation.dart';

part 'application.g.dart';

@JsonEnum(valueField: 'value')
enum StatusGroup {
  @JsonValue('finished')
  finished,

  @JsonValue('inprocess')
  inProcess,
}

@JsonSerializable()
class AddressTo {
  final String address;
  final Coords coords;

  AddressTo({required this.address, required this.coords});

  factory AddressTo.fromJson(Map<String, dynamic> json) =>
      _$AddressToFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToToJson(this);
}

@JsonSerializable()
class Coords {
  final double lat;
  final double long;

  Coords({required this.lat, required this.long});

  factory Coords.fromJson(Map<String, dynamic> json) => _$CoordsFromJson(json);
  Map<String, dynamic> toJson() => _$CoordsToJson(this);
}

@JsonSerializable()
class Client {
  final String name;
  final String id;

  Client({required this.name, required this.id});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}

@JsonSerializable()
class Application {
  final String id;
  final AddressTo addressTo;
  final Client client;
  final StatusGroup statusGroup;

  Application({
    required this.id,
    required this.addressTo,
    required this.client,
    required this.statusGroup,
  });

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}
