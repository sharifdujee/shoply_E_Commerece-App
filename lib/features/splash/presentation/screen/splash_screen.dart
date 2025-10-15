import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply_app/core/global/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoply_app/core/global/custom_text.dart';
import 'package:shoply_app/core/utils/app_color.dart';
import 'package:shoply_app/core/utils/app_text.dart';

import '../../controller/splash_controller.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Call splash logic after the first frame renders
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashControllerProvider).startSplashTimer(context);
    });

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 80.w, vertical: 100.h),
          child: CustomText(
            text: AppText.appName,
            fontSize: 24.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

