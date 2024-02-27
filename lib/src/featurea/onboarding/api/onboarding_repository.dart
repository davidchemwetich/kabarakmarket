// ignore_for_file: non_constant_identifier_names

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'onboarding_repository.g.dart';

@riverpod
OnboardingRepository onboardingRepository(_) => OnboardingRepository();

class OnboardingRepository {
  final _client = Supabase.instance.client;

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String username,
    required String phone_number,
  }) async {
    return _client.auth.signUp(
      email: email,
      password: password,
      data: {'username': username, 'phone_number': phone_number},
    );
  }

  Future<AuthResponse> verifyCode({
    required String email,
    required String code,
  }) async {
    return _client.auth.verifyOTP(
      email: email,
      token: code,
      type: OtpType.signup,
    );
  }
}
