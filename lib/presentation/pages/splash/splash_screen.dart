import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/core/services/navigation_service.dart';
import 'package:xtop_app/presentation/atoms/icons/app_logo.dart';
import 'package:xtop_app/presentation/atoms/images/app_background_img.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      NavigationService.handleSplashNavigation(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primaryColor,
        child: const SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AppBackgroundImage(image: 'assets/images/app_background.png'),
              AppLogo(
                width: 200,
                height: 117,
                padding: EdgeInsets.only(bottom: 60),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
