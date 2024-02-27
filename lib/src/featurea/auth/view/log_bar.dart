// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';

class Logbar extends StatelessWidget implements PreferredSizeWidget {
  const Logbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF551d60),
          Color(0xFF2e1e37),
          Color(0xFF3c2245),
          Color(0xFF491f52),
        ])),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
