import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shoply_app/core/constants/logo_path.dart';
import 'package:shoply_app/core/global/custom_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoply_app/core/utils/app_color.dart';
import 'package:shoply_app/core/utils/app_text.dart';

import '../../controller/splash_controller.dart';



class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ Use ref.listen with fireImmediately to trigger only once
    ref.listen<bool>(
      splashControllerProvider,
          (prev, next) {
        // This runs when state changes
      },
      //fireImmediately: false,
    );

    // ✅ Better approach: Use a flag to prevent multiple calls
    final hasStarted = ref.read(splashControllerProvider);
    if (!hasStarted) {
      // Schedule for next frame
      Future.microtask(() {
        if (context.mounted) {
          ref.read(splashControllerProvider.notifier).startSplashTimer(context);
        }
      });
    }

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100.w, vertical: 250.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(LogoPath.appLogo, fit: BoxFit.cover),
                SizedBox(width: 16.w),
                CustomText(
                  text: AppText.appName,
                  fontSize: 24.sp,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const Spacer(),
          SpinKitFadingCircle(
            color: AppColor.black,
            size: 100.h,
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}

// ============================================================
// BEST APPROACH: Use AutoDispose with timer in provider itself
// ============================================================

final splashTimerProvider = Provider.autoDispose<void>((ref) {
  // This will only run once when the provider is first read
  final context = ref.watch(navigationContextProvider);

  Future.delayed(const Duration(seconds: 2), () {
    if (context.mounted) {
      // Navigate using GoRouter
      // context.go('/onboarding');
    }
  });
});

// Provider to hold the BuildContext (if needed)
final navigationContextProvider = Provider<BuildContext>((ref) {
  throw UnimplementedError('Must be overridden');
});

class SplashScreenBestPractice extends ConsumerWidget {
  const SplashScreenBestPractice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Override the context provider
    ref.listen(
      splashTimerProvider,
          (_, __) {},
      onError: (_, __) {},
    );

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100.w, vertical: 250.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(LogoPath.appLogo, fit: BoxFit.cover),
                SizedBox(width: 16.w),
                CustomText(
                  text: AppText.appName,
                  fontSize: 24.sp,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const Spacer(),
          SpinKitFadingCircle(
            color: AppColor.black,
            size: 100.h,
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}


