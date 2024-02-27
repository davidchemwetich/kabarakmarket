import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LazyBarLoad extends StatelessWidget implements PreferredSizeWidget {
  const LazyBarLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.pink,
        ),
        onPressed: () {
          final router = GoRouter.of(context);
          router.push('/');
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF2e1e37),
          Color(0xFF3c2245),
          Color(0xFF491f52),
          Color(0xFF551d60),
        ])),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
