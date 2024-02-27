import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabarakmarket/src/featurea/auth/providers/auth_user.dart';
import 'package:kabarakmarket/src/featureb/api/memory_repository.dart';
import 'package:kabarakmarket/src/featureb/models/memory.dart';
import 'package:kabarakmarket/src/featureb/providers/likes_count.dart';

class LikesCounter extends ConsumerWidget {
  const LikesCounter({required this.data, super.key});

  final Memory data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likesCount = ref.watch(likesCountProvider(data));
    final info = likesCount.asData?.value;
    final likes = info?.count ?? 0;
    final user = ref.watch(authUserProvider).asData?.value;

    return SizedBox(
      width: 60,
      child: FilledButton(
        onPressed: user == null || likesCount.isLoading
            ? null
            : () {
                final api = ref.read(memoryRepositoryProvider);
                if (info?.hasLiked == true) {
                  api.removeLike(data.id);
                } else {
                  api.addLike(data.id);
                }
              },
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.diamond_outlined,
              size: 20,
              color: info?.hasLiked == true
                  ? Colors.green
                  : likes > 0
                      ? Colors.pink
                      : Colors.green,
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                '$likes',
                style: const TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
