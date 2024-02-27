import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kabarakmarket/src/featured/providers/appartment_notifier.dart';
import 'package:kabarakmarket/src/featured/widget/apartment_item_view.dart';

class AppartmentListView extends ConsumerWidget {
  const AppartmentListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appartmentNotifier = ref.watch(appartmentNotifierProvider);
    return appartmentNotifier.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (err, _) => Center(
        child: Text(err.toString()),
      ),
      data: (data) => MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return AppartmentItemView(data: data[index]);
          }),
    );
  }
}
