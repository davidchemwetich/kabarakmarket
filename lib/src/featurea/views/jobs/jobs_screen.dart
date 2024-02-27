import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabarakmarket/src/featurea/widgets/fake_bar.dart';

class Jobs extends ConsumerStatefulWidget {
  const Jobs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobsState();
}

class _JobsState extends ConsumerState<Jobs> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Lazybar(),
    );
  }
}
