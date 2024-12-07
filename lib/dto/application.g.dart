// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressTo _$AddressToFromJson(Map<String, dynamic> json) => AddressTo(
      address: json['address'] as String,
      coords: Coords.fromJson(json['coords'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressToToJson(AddressTo instance) => <String, dynamic>{
      'address': instance.address,
      'coords': instance.coords,
    };

Coords _$CoordsFromJson(Map<String, dynamic> json) => Coords(
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordsToJson(Coords instance) => <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      name: json['name'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

Application _$ApplicationFromJson(Map<String, dynamic> json) => Application(
      id: json['id'] as String,
      addressTo: AddressTo.fromJson(json['addressTo'] as Map<String, dynamic>),
      client: Client.fromJson(json['client'] as Map<String, dynamic>),
      statusGroup: $enumDecode(_$StatusGroupEnumMap, json['statusGroup']),
    );

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addressTo': instance.addressTo,
      'client': instance.client,
      'statusGroup': _$StatusGroupEnumMap[instance.statusGroup]!,
    };

const _$StatusGroupEnumMap = {
  StatusGroup.finished: 'finished',
  StatusGroup.inProcess: 'inprocess',
};
