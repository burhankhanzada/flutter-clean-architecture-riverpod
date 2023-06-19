import 'package:flutter_project/features/authentication/domain/providers/login_provider.dart';
import 'package:flutter_project/features/authentication/presentation/providers/state/auth_notifier.dart';
import 'package:flutter_project/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:flutter_project/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    final authenticationRepository = ref.watch(authRepositoryProvider);
    final userRepository = ref.watch(userLocalRepositoryProvider);
    return AuthNotifier(
      authRepository: authenticationRepository,
      userRepository: userRepository,
    );
  },
);
