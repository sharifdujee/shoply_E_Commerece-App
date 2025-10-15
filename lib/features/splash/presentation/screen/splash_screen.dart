import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply_app/core/global/custom_text.dart';
import 'package:shoply_app/core/utils/app_color.dart';
import 'package:shoply_app/core/utils/app_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80.w, vertical: 100.h),
      decoration: BoxDecoration(
        color: AppColor.primaryColor
      ),
      child: CustomText(text: AppText.appName),
    );
  }
}
