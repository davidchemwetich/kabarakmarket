// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appartments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Appartments _$AppartmentsFromJson(Map<String, dynamic> json) {
  return _Appartments.fromJson(json);
}

/// @nodoc
mixin _$Appartments {
  int get id => throw _privateConstructorUsedError;
  String get title_desc => throw _privateConstructorUsedError;
  String get price_desc => throw _privateConstructorUsedError;
  String get apart_desc => throw _privateConstructorUsedError;
  String get location_apart => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_id')
  String get imageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readProfileId)
  String get profileId => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readUsername)
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppartmentsCopyWith<Appartments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppartmentsCopyWith<$Res> {
  factory $AppartmentsCopyWith(
          Appartments value, $Res Function(Appartments) then) =
      _$AppartmentsCopyWithImpl<$Res, Appartments>;
  @useResult
  $Res call(
      {int id,
      String title_desc,
      String price_desc,
      String apart_desc,
      String location_apart,
      @JsonKey(name: 'image_id') String imageId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(readValue: _readProfileId) String profileId,
      @JsonKey(readValue: _readUsername) String username});
}

/// @nodoc
class _$AppartmentsCopyWithImpl<$Res, $Val extends Appartments>
    implements $AppartmentsCopyWith<$Res> {
  _$AppartmentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title_desc = null,
    Object? price_desc = null,
    Object? apart_desc = null,
    Object? location_apart = null,
    Object? imageId = null,
    Object? createdAt = null,
    Object? profileId = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title_desc: null == title_desc
          ? _value.title_desc
          : title_desc // ignore: cast_nullable_to_non_nullable
              as String,
      price_desc: null == price_desc
          ? _value.price_desc
          : price_desc // ignore: cast_nullable_to_non_nullable
              as String,
      apart_desc: null == apart_desc
          ? _value.apart_desc
          : apart_desc // ignore: cast_nullable_to_non_nullable
              as String,
      location_apart: null == location_apart
          ? _value.location_apart
          : location_apart // ignore: cast_nullable_to_non_nullable
              as String,
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppartmentsCopyWith<$Res>
    implements $AppartmentsCopyWith<$Res> {
  factory _$$_AppartmentsCopyWith(
          _$_Appartments value, $Res Function(_$_Appartments) then) =
      __$$_AppartmentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title_desc,
      String price_desc,
      String apart_desc,
      String location_apart,
      @JsonKey(name: 'image_id') String imageId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(readValue: _readProfileId) String profileId,
      @JsonKey(readValue: _readUsername) String username});
}

/// @nodoc
class __$$_AppartmentsCopyWithImpl<$Res>
    extends _$AppartmentsCopyWithImpl<$Res, _$_Appartments>
    implements _$$_AppartmentsCopyWith<$Res> {
  __$$_AppartmentsCopyWithImpl(
      _$_Appartments _value, $Res Function(_$_Appartments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title_desc = null,
    Object? price_desc = null,
    Object? apart_desc = null,
    Object? location_apart = null,
    Object? imageId = null,
    Object? createdAt = null,
    Object? profileId = null,
    Object? username = null,
  }) {
    return _then(_$_Appartments(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title_desc: null == title_desc
          ? _value.title_desc
          : title_desc // ignore: cast_nullable_to_non_nullable
              as String,
      price_desc: null == price_desc
          ? _value.price_desc
          : price_desc // ignore: cast_nullable_to_non_nullable
              as String,
      apart_desc: null == apart_desc
          ? _value.apart_desc
          : apart_desc // ignore: cast_nullable_to_non_nullable
              as String,
      location_apart: null == location_apart
          ? _value.location_apart
          : location_apart // ignore: cast_nullable_to_non_nullable
              as String,
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Appartments implements _Appartments {
  const _$_Appartments(
      {required this.id,
      required this.title_desc,
      required this.price_desc,
      required this.apart_desc,
      required this.location_apart,
      @JsonKey(name: 'image_id') required this.imageId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(readValue: _readProfileId) required this.profileId,
      @JsonKey(readValue: _readUsername) required this.username});

  factory _$_Appartments.fromJson(Map<String, dynamic> json) =>
      _$$_AppartmentsFromJson(json);

  @override
  final int id;
  @override
  final String title_desc;
  @override
  final String price_desc;
  @override
  final String apart_desc;
  @override
  final String location_apart;
  @override
  @JsonKey(name: 'image_id')
  final String imageId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(readValue: _readProfileId)
  final String profileId;
  @override
  @JsonKey(readValue: _readUsername)
  final String username;

  @override
  String toString() {
    return 'Appartments(id: $id, title_desc: $title_desc, price_desc: $price_desc, apart_desc: $apart_desc, location_apart: $location_apart, imageId: $imageId, createdAt: $createdAt, profileId: $profileId, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Appartments &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title_desc, title_desc) ||
                other.title_desc == title_desc) &&
            (identical(other.price_desc, price_desc) ||
                other.price_desc == price_desc) &&
            (identical(other.apart_desc, apart_desc) ||
                other.apart_desc == apart_desc) &&
            (identical(other.location_apart, location_apart) ||
                other.location_apart == location_apart) &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title_desc, price_desc,
      apart_desc, location_apart, imageId, createdAt, profileId, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppartmentsCopyWith<_$_Appartments> get copyWith =>
      __$$_AppartmentsCopyWithImpl<_$_Appartments>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppartmentsToJson(
      this,
    );
  }
}

abstract class _Appartments implements Appartments {
  const factory _Appartments(
          {required final int id,
          required final String title_desc,
          required final String price_desc,
          required final String apart_desc,
          required final String location_apart,
          @JsonKey(name: 'image_id') required final String imageId,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(readValue: _readProfileId) required final String profileId,
          @JsonKey(readValue: _readUsername) required final String username}) =
      _$_Appartments;

  factory _Appartments.fromJson(Map<String, dynamic> json) =
      _$_Appartments.fromJson;

  @override
  int get id;
  @override
  String get title_desc;
  @override
  String get price_desc;
  @override
  String get apart_desc;
  @override
  String get location_apart;
  @override
  @JsonKey(name: 'image_id')
  String get imageId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(readValue: _readProfileId)
  String get profileId;
  @override
  @JsonKey(readValue: _readUsername)
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$_AppartmentsCopyWith<_$_Appartments> get copyWith =>
      throw _privateConstructorUsedError;
}
