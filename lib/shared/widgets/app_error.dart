import 'package:flutter/material.dart';
import 'package:flutter_project/shared/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppError extends ConsumerWidget {
  const AppError({super.key});
  static const String routeName = 'appError';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        onTap: theme.toggleTheme,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 42,
              color: Theme.of(context).colorScheme.error,
            ),
            Center(
              child: Text(
                'Error occured',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
