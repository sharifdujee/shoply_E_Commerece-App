import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


import 'package:flutter/material.dart';




final splashControllerProvider =
NotifierProvider<SplashController, bool>(SplashController.new);

class SplashController extends Notifier<bool> {
  @override
  bool build() {
    // Initial state
    return false;
  }

  Future<void> startSplashTimer(BuildContext context) async {
    // Prevent double navigation
    if (state) return;
    state = true;

    await Future.delayed(const Duration(seconds: 2));

    // Ensure safe navigation
    if (context.mounted) {
      context.go('/onboarding');
    }
  }
}

// Alternative: Using AsyncNotifier for async operations
final splashAsyncControllerProvider =
AsyncNotifierProvider<SplashAsyncController, void>(
    SplashAsyncController.new);

class SplashAsyncController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // Initial state - no async work here
  }

  Future<void> startSplashTimer(BuildContext context) async {
    state = const AsyncLoading();

    await Future.delayed(const Duration(seconds: 2));

    if (context.mounted) {
      context.go('/onboarding');
      state = const AsyncData(null);
    }
  }
}

// Usage in Widget:
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start splash timer after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashControllerProvider.notifier).startSplashTimer(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isNavigating = ref.watch(splashControllerProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your splash screen content
            const Icon(
              Icons.chair,
              size: 100,
              color: Colors.amber,
            ),
            const SizedBox(height: 24),
            const Text(
              'Funica',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            if (isNavigating)
              const CircularProgressIndicator()
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}


