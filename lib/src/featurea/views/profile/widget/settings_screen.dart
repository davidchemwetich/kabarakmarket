// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabarakmarket/src/featurea/auth/api/auth_repository.dart';
import 'package:kabarakmarket/src/featurea/auth/providers/auth_user.dart';
import 'package:kabarakmarket/src/featurea/home_page.dart';
import 'package:kabarakmarket/src/featurea/views/profile/widget/app_barset.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authUserProvider).asData?.value;

    TextStyle headingStyle = const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.pink);
    return Scaffold(
      appBar: const Setbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Account", style: headingStyle),
                ],
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.mail),
                title: Text("Email"),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                ),
                title: const Text(
                  'Log Out',
                ),
                onTap: () async {
                  showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: const Center(
                          child: Text(
                            'Log Out',
                          ),
                        ),
                        content: const Text(
                          'We\'re sorry to see you go. Are you sure you want to log out?',
                        ),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'No',
                              style: TextStyle(color: Colors.pink),
                            ),
                          ),
                          CupertinoDialogAction(
                            isDestructiveAction: true,
                            onPressed: () async {
                              await ref.read(authRepositoryProvider).logout();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Terms", style: headingStyle),
                ],
              ),
              const ListTile(
                leading: Icon(Icons.file_open_outlined),
                title: Text("Terms of Service"),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.file_copy_outlined),
                title: Text("Open Source and Licences"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
