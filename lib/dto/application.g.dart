// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) => Application(
      id: json['id'] as String,
      addressTo: Address.fromJson(json['addressTo'] as Map<String, dynamic>),
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
  StatusGroup.Finished: 'Finished',
  StatusGroup.Inprocess: 'Inprocess',
  StatusGroup.Archived: 'Archived',
  StatusGroup.Completed: 'Completed',
};

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      coords: json['coords'] == null
          ? null
          : Coords.fromJson(json['coords'] as Map<String, dynamic>),
      details: json['details'] as String? ?? '',
      flat: json['flat'] as String? ?? '',
      floor: json['floor'] as String? ?? '',
      porch: json['porch'] as String? ?? '',
      domofon: json['domofon'] as String? ?? '',
      commentary: json['commentary'] as String? ?? '',
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'coords': instance.coords,
      'details': instance.details,
      'flat': instance.flat,
      'floor': instance.floor,
      'porch': instance.porch,
      'domofon': instance.domofon,
      'commentary': instance.commentary,
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
      phone: json['phone'] as String,
      email: json['email'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'phone': instance.phone,
      'email': instance.email,
      'description': instance.description,
    };
