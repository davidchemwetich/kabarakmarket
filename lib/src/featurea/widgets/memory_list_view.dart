import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kabarakmarket/src/featurea/views/category/view/product_view.dart';
import 'package:kabarakmarket/src/featureb/providers/memory_notifier.dart';
import 'package:kabarakmarket/src/featurea/widgets/memory_item_view.dart';
// import 'package:shimmer/shimmer.dart';

class MemoryListView extends ConsumerWidget {
  const MemoryListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoryNotifier = ref.watch(memoryNotifierProvider);

    return memoryNotifier.when(
      loading: () => const CircularProgressIndicator.adaptive(),
      error: (err, _) => Center(
        child: Text(err.toString()),
      ),
      data: (data) => MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductView(data: data[index]),
                ),
              );
            },
            child: MemoryItemView(
              data: data[index],
            ),
          );
        },
      ),
    );
  }
}
