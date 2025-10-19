import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply_app/core/global/custom_text.dart';
import 'package:shoply_app/core/utils/app_color.dart';

class CustomOnBoarding extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String description;
  final bool isDark;

  const CustomOnBoarding({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.description,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Container(
        // Gradient overlay for better text readability
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [
                    Colors.black.withValues(alpha: 0.3),
                    Colors.black.withValues(alpha: 0.6),
                  ]
                : [Colors.transparent, Colors.white.withValues(alpha: 0.3)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: subtitle.isNotEmpty
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                if (subtitle.isNotEmpty) ...[
                  CustomText(
                    text: title,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.onBoardingHeader,
                  ),

                  SizedBox(height: 8.h),
                  CustomText(
                    text: subtitle,
                    fontWeight: FontWeight.w700,
                    fontSize: 48.sp,
                    color: isDark ? AppColor.white : AppColor.black,
                  ),

                  if (description.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    CustomText(
                      text: description,
                      fontSize: 14.sp,
                      height: 1.5,
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.8)
                          : Colors.black.withValues(alpha: 0.7),
                    ),
                  ],
                ] else ...[
                  CustomText(
                    text: title,
                    textAlign: TextAlign.center,

                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ],
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
