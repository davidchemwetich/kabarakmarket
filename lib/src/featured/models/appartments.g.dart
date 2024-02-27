// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appartments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Appartments _$$_AppartmentsFromJson(Map<String, dynamic> json) =>
    _$_Appartments(
      id: json['id'] as int,
      title_desc: json['title_desc'] as String,
      price_desc: json['price_desc'] as String,
      apart_desc: json['apart_desc'] as String,
      location_apart: json['location_apart'] as String,
      imageId: json['image_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      profileId: _readProfileId(json, 'profileId') as String,
      username: _readUsername(json, 'username') as String,
    );

Map<String, dynamic> _$$_AppartmentsToJson(_$_Appartments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title_desc': instance.title_desc,
      'price_desc': instance.price_desc,
      'apart_desc': instance.apart_desc,
      'location_apart': instance.location_apart,
      'image_id': instance.imageId,
      'created_at': instance.createdAt.toIso8601String(),
      'profileId': instance.profileId,
      'username': instance.username,
    };
