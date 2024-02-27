import 'package:kabarakmarket/src/featured/components/api/apartment_repo.dart';
import 'package:kabarakmarket/src/featured/models/appartments.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appartment_notifier.g.dart';

@riverpod
class AppartmentNotifier extends _$AppartmentNotifier {
  @override
  Future<List<Appartments>> build() async {
    return ref.read(apartmentRepositoryProvider).getAppartments();
  }
}
