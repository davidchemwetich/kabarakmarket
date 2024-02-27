import 'dart:io';

import 'package:kabarakmarket/src/featureb/models/memory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'memory_repository.g.dart';

@riverpod
MemoryRepository memoryRepository(MemoryRepositoryRef _) => MemoryRepository();

class MemoryRepository {
  final _client = Supabase.instance.client;

  String get storageUrl => _client.storageUrl;

  RealtimeChannel get memoryChannel => _client.channel('public:products');

  Future<List<Memory>> getproducts() => _client
      .from('products')
      .select<List<Map<String, dynamic>>>(
          'id, title,description,linkvid,price, image_id , created_at, profiles (id, username , phone_number)')
      .order('created_at')
      .then((data) => data.map((json) => Memory.fromJson(json)).toList());

  Future<void> addMemory({
    required String title,
    required String description,
    required String linkvid,
    required String price,
    required File file,
  }) async {
    final profileId = _client.auth.currentSession?.user.id;
    final imageId = file.path.split('/').last;

    if (profileId == null) {
      throw 'Missing profile id';
    }

    await _client.from('products').insert({
      'title': title,
      'description': description,
      'linkvid': linkvid,
      'price': price,
      'image_id': imageId,
      'profile_id': profileId,
    });

    await _client.storage.from('rustyideas').upload(
          '$profileId/$imageId',
          file,
        );
  }

  Future<void> updateMemory({
    required int id,
    required String title,
    required String price,
    required String description,
    required String linkvid,
  }) async {
    final profileId = _client.auth.currentSession?.user.id;

    await _client
        .from('products')
        .update({
          'title': title,
          'description': description,
          'linkvid': linkvid,
          'price': price,
        })
        .eq('id', id)
        .eq('profile_id', profileId);
  }

  Future<void> deleteMemory(Memory data) async {
    final profileId = _client.auth.currentSession?.user.id;
    final imageId = data.imageId;

    await _client.storage.from('products').remove(['$profileId/$imageId']);

    await _client
        .from('products')
        .delete()
        .eq('id', data.id)
        .eq('profile_id', profileId);
  }

  Stream<List<Map<String, dynamic>>> get likes =>
      _client.from('likes').stream(primaryKey: ['id']);

  Future<void> addLike(int memoryId) async {
    final profileId = _client.auth.currentSession?.user.id;

    await _client.from('likes').insert({
      'product_id': memoryId,
      'profile_id': profileId,
    });
  }

  Future<void> removeLike(int memoryId) async {
    final profileId = _client.auth.currentSession?.user.id;

    await _client
        .from('likes')
        .delete()
        .eq('product_id', memoryId)
        .eq('profile_id', profileId);
  }
}
