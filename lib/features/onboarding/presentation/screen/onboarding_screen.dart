
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart' show StateProvider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply_app/core/constants/image_path.dart';
import 'package:shoply_app/core/utils/app_text.dart';

import '../../../../core/global/custom_text.dart';
import '../widget/custom_onboarding_widget.dart';

final currentPageProvider = StateProvider<int>((ref) => 0);


class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);
    final pageController = PageController(initialPage: currentPage);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                ref.read(currentPageProvider.notifier).state = index;
              },
              children:  [
                CustomOnBoarding(
                  imagePath: ImagePath.onBoardingOne,
                  title: AppText.welcome,
                  subtitle: AppText.appName,
                  description: AppText.onBoardingOne,
                  isDark: true,
                ),
                CustomOnBoarding(
                  imagePath: ImagePath.onBoardingTwo,
                  title: AppText.onBoardingTwo,
                  subtitle: '',
                  description: '',
                  isDark: false,
                ),
                CustomOnBoarding(
                  imagePath: ImagePath.onBoardingThree,
                  title: AppText.onBoardingThree,
                  subtitle: '',
                  description: '',
                  isDark: false,
                ),
                CustomOnBoarding(
                  imagePath: ImagePath.onBoardingFour,
                  title: AppText.onBoardingFour,
                  subtitle: '',
                  description: '',
                  isDark: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Page indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                        (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: currentPage == index ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: currentPage == index
                            ? Colors.black
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Next/Get Started button
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (currentPage < 3) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        // Navigate to home or main app
                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                            content: CustomText(text:'Welcome to Funica!'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      currentPage == 3 ? 'Get Started' : 'Next',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

