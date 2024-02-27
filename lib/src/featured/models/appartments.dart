import 'package:freezed_annotation/freezed_annotation.dart';

part 'appartments.freezed.dart';
part 'appartments.g.dart';

String _readProfileId(Map json, _) => json['profiles']['id'];
String _readUsername(Map json, _) => json['profiles']['username'];

@freezed
class Appartments with _$Appartments {
  const factory Appartments({
    required int id,
    required String title_desc,
    required String price_desc,
    required String apart_desc,
    required String location_apart,
    @JsonKey(name: 'image_id') required String imageId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(readValue: _readProfileId) required String profileId,
    @JsonKey(readValue: _readUsername) required String username,
  }) = _Appartments;

  factory Appartments.fromJson(Map<String, Object?> json) =>
      _$AppartmentsFromJson(json);
}
