import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kabarakmarket/src/domain/upload/widget/upload_appbar.dart';
import 'package:kabarakmarket/src/featurea/auth/providers/auth_user.dart';
import 'package:kabarakmarket/src/utils/utils.dart';

class UploadApart extends ConsumerWidget {
  const UploadApart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authUserProvider).asData?.value;
    return Scaffold(
      appBar: const LazyBarLoad(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            if (user == null)
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/login');
                  },
                  child: const Text('Log In To Advertise Your Apartment'),
                ),
              ),
          ],
        ),
      ),
      //
      floatingActionButton: user == null
          ? null
          : FloatingActionButton(
              onPressed: () {
                context.showBottomSheet(
                  child: const SizedBox(
                    height: 900, // Set the constant height here
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      // child: MemoryItemForm(),
                    ),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
    );
  }
}
