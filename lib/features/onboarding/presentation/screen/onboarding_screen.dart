
import 'package:flutter/material.dart';
import 'package:shoply_app/core/global/custom_text.dart';
import 'package:shoply_app/core/utils/app_text.dart';



class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText(text: AppText.appName)),
    );
  }
}

