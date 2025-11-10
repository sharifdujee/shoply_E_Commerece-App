import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply_app/core/constants/icon_path.dart';
import 'package:shoply_app/core/constants/image_path.dart';
import 'package:shoply_app/core/global/custom_text.dart';

import '../widget/social_media_auth.dart';
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w, bottom: 30.h),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: Icon(Icons.arrow_back)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 75.w),
              child: Image.asset(ImagePath.signIn),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.h, left: 24.w, right: 24.w, bottom: 30.h),
                child: CustomText(text: "Let's you in", fontSize: 48.sp,fontWeight: FontWeight.bold,)),
            /// social Media Section
            SocialMediaAuth(
              mediaIcon: IconPath.facebook,
              mediaName: "Facebook",
            ),
            SizedBox(height: 16.h,),
            SocialMediaAuth(
              mediaIcon: IconPath.google,
              mediaName: "Google",
            ),
            SizedBox(height: 16.h,),
            SocialMediaAuth(
              mediaIcon: IconPath.apple,
              mediaName: "Apple",
            ),
            SizedBox(height: 16.h,),
            ///
          ],
        ),
      ),

    );
  }
}


