import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final splashControllerProvider = Provider<SplashController>((ref) {
  return SplashController(ref);
});

class SplashController {
  final Ref ref;

  SplashController(this.ref);

  Future<void> startSplashTimer(context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (context.mounted) {
      context.go("/onboarding");
    }
  }
}
