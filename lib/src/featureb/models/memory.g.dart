// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names, unnecessary_cast

part of 'memory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Memory _$$_MemoryFromJson(Map<String, dynamic> json) => _$_Memory(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      linkvid: json['linkvid'] as String,
      price: json['price'] as String,
      imageId: json['image_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      profileId: _readProfileId(json, 'profileId') as String,
      username: _readUsername(json, 'username') as String,
    );

Map<String, dynamic> _$$_MemoryToJson(_$_Memory instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'linkvid': instance.linkvid,
      'price': instance.price,
      'image_id': instance.imageId,
      'created_at': instance.createdAt.toIso8601String(),
      'profileId': instance.profileId,
      'username': instance.username,
    };
