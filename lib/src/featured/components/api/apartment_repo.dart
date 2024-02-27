import 'package:kabarakmarket/src/featured/models/appartments.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'apartment_repo.g.dart';

@riverpod
ApartmentRepository apartmentRepository(ApartmentRepositoryRef _) =>
    ApartmentRepository();

class ApartmentRepository {
  final _client = Supabase.instance.client;

  String get storageUrl => _client.storageUrl;

  Future<List<Appartments>> getAppartments() => _client
      .from('apartments')
      .select<List<Map<String, dynamic>>>(
          'id, title_desc,price_desc,apart_desc,location_apart, image_id , created_at, profiles (id, username , phone_number)')
      .order('created_at')
      .then((data) => data.map((json) => Appartments.fromJson(json)).toList());
}
