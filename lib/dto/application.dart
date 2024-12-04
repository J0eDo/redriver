import 'package:json_annotation/json_annotation.dart';

part 'application.g.dart';


@JsonSerializable()
class Application {
  final String id;
  final Address addressTo;
  final Client client;
  final StatusGroup statusGroup; 

  Application({
    required this.id,
    required this.addressTo,
    required this.client,
    required this.statusGroup

  });

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}

enum StatusGroup {
  Finished,
  Inprocess,
  Archived,
  Completed,
}

@JsonSerializable()
class Address {
  final Coords? coords;
  final String details;
  final String flat;
  final String floor;
  final String porch;
  final String domofon;
  final String commentary;

  Address({
    this.coords,
    this.details = '', // Значение по умолчанию
    this.flat = '', // Значение по умолчанию
    this.floor = '', // Значение по умолчанию
    this.porch = '', // Значение по умолчанию
    this.domofon = '', // Значение по умолчанию
    this.commentary = '', // Значение по умолчанию
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Coords {
  final double lat;
  final double long;

  Coords({
    required this.lat,
    required this.long,
  });

  factory Coords.fromJson(Map<String, dynamic> json) =>
      _$CoordsFromJson(json);
  Map<String, dynamic> toJson() => _$CoordsToJson(this);
}

@JsonSerializable()
class Client {
  final String name;
  final String id;
  final String phone;
  final String email;
  final String description;

  Client({
    required this.name,
    required this.id,
    required this.phone,
    required this.email,
    required this.description,
  });

  factory Client.fromJson(Map<String, dynamic> json) =>
      _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
