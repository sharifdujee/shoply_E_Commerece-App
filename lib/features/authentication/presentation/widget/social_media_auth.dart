import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global/custom_text.dart';

class SocialMediaAuth extends StatelessWidget {
  const SocialMediaAuth({
    super.key,
    required this.mediaIcon,
    required this.mediaName
  });
  final String mediaIcon;
  final String mediaName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
              width: 1.w,
              color: Color(0xFF9E9E9E)
          )
      ),
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Image.asset(mediaIcon,height: 48.h,width: 48.w,),
          SizedBox(width: 12.w,),
          CustomText(text: "Continue With $mediaName", fontWeight: FontWeight.w500,fontSize: 16.sp,)


        ],
      ),
    );
  }
}