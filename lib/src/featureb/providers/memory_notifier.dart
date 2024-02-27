// ignore_for_file: avoid_print

import 'package:kabarakmarket/src/featureb/api/memory_repository.dart';
import 'package:kabarakmarket/src/featureb/models/memory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'memory_notifier.g.dart';

@riverpod
class MemoryNotifier extends _$MemoryNotifier {
  @override
  Future<List<Memory>> build() async {
    _initMemoryChannel();
    return ref.read(memoryRepositoryProvider).getproducts();
  }

  void _initMemoryChannel() {
    ref.read(memoryRepositoryProvider).memoryChannel.on(
      RealtimeListenTypes.postgresChanges,
      ChannelFilter(
        event: '*',
        schema: 'public',
        table: 'products',
      ),
      (payload, [_]) async {
        print(payload);

        if (['INSERT', 'UPDATE', 'DELETE'].contains(payload['eventType'])) {
          state = await AsyncValue.guard(
            () async => ref.read(memoryRepositoryProvider).getproducts(),
          );
        }
      },
    ).subscribe();
  }
}
