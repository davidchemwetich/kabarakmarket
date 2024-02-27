// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kabarakmarket/src/featurea/auth/api/auth_repository.dart';
import 'package:kabarakmarket/src/featurea/auth/view/log_bar.dart';
import 'package:kabarakmarket/src/featurea/onboarding/onboarding.dart';
import 'package:kabarakmarket/src/utils/utils.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode? _autovalidateMode;
  bool _isSubmitting = false;

  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _usernameCtrl = TextEditingController();
  final _phonenumberCtrl = TextEditingController();

  Future<void> _login() async {
    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref.read(authRepositoryProvider).logIn(
            email: _emailCtrl.text,
            password: _passwordCtrl.text,
          );

      if (mounted) {
        context.pop();
      }
    } catch (e) {
      setState(() {
        _isSubmitting = false;
      });

      context.showAlert(e.toString());
    }
  }

  Future<void> _createAccount() async {
    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref.read(onboardingRepositoryProvider).signUp(
            email: _emailCtrl.text,
            password: _passwordCtrl.text,
            username: _usernameCtrl.text,
            phone_number: _phonenumberCtrl.text,
          );

      if (mounted) {
        context.push(
          '/verification',
          extra: VerificationPageParams(
            email: _emailCtrl.text,
            password: _passwordCtrl.text,
            username: _usernameCtrl.text,
            phone_number: _phonenumberCtrl.text,
          ),
        );
      }
    } catch (e) {
      context.showAlert(e.toString());
    }

    setState(() {
      _isSubmitting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Logbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailCtrl,
                  readOnly: _isSubmitting,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordCtrl,
                  readOnly: _isSubmitting,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _isSubmitting
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              _login();
                            } else {
                              setState(() {
                                _autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                    child: const Text('Log In'),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 10),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _usernameCtrl,
                  readOnly: _isSubmitting,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _phonenumberCtrl,
                  readOnly: _isSubmitting,
                  decoration: const InputDecoration(
                    labelText: 'phone_number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: _isSubmitting
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              _createAccount();
                            } else {
                              setState(() {
                                _autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                    child: const Text('Create an Account'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
