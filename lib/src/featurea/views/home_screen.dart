import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kabarakmarket/src/featurea/views/profile/widget/drawer_screen.dart';
import 'package:kabarakmarket/src/featurea/views/widget/home_appbar.dart';
import 'package:kabarakmarket/src/featurec/view/advert_screen.dart';
import 'package:kabarakmarket/src/featured/constants/appartment_colors.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: const SizedBox(
        child: MyDrawer(),
      ),
      appBar: const AppbarUI(
        key: null,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientBackground,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: const Column(
          children: [
            AddSell(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add your action here
      //   },
      //   splashColor: Colors.green,
      //   shape: const CircleBorder(),
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.pinkAccent,
      //   ),
      // ),
    );
  }
}
