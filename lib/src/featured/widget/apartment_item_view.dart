import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabarakmarket/src/featured/apartment_screen.dart';
import 'package:kabarakmarket/src/featured/components/api/apartment_repo.dart';
import 'package:kabarakmarket/src/featured/models/appartments.dart';

class AppartmentItemView extends ConsumerWidget {
  final Appartments data;
  const AppartmentItemView({required this.data, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageUrl = ref.read(apartmentRepositoryProvider).storageUrl;
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Image.network(
            '$storageUrl/object/public/appartments/${data.profileId}/${data.imageId}',
          )
        ],
      ),
    );
  }
}
