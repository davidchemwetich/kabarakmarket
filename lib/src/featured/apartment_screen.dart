import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabarakmarket/src/featurea/widgets/fake_bar.dart';
import 'package:kabarakmarket/src/featured/constants/appartment_colors.dart';
import 'package:kabarakmarket/src/featured/widget/apartment_view.dart';

class Apartment extends ConsumerStatefulWidget {
  const Apartment({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ApartmentState();
}

class _ApartmentState extends ConsumerState<Apartment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Lazybar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientBackground,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: const Stack(
          children: [Positioned.fill(child: AppartmentListView())],
        ),
      ),
    );
  }
}
