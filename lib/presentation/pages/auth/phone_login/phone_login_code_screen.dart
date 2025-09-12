import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/core/services/local_storage.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/icons/app_icon.dart';
import 'package:xtop_app/presentation/atoms/icons/app_logo.dart';
import 'package:xtop_app/presentation/atoms/input/number_input.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';
import 'package:xtop_app/presentation/atoms/texts/line_text.dart';
import 'package:xtop_app/presentation/organisms/bottom/bottom_text_button.dart';
import 'package:xtop_app/presentation/organisms/timer/timer_section.dart';

class PhoneLoginCodeScreen extends StatefulWidget {
  const PhoneLoginCodeScreen({super.key});

  @override
  State<PhoneLoginCodeScreen> createState() => _PhoneLoginCodeScreenState();
}

class _PhoneLoginCodeScreenState extends State<PhoneLoginCodeScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _showCenterMessage(String message,
      {Color? backgroundColor}) async {
    if (!mounted) return;

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 32),
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.red,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      overlayEntry.remove();
    }
  }

  void _onConfirmPressed() async {
    final code = _codeController.text.trim();

    // Input validation
    if (!RegExp(r'^\d{4}$').hasMatch(code)) {
      await _showCenterMessage('4 xonali raqamli kodni kiriting');
      return;
    }

    // Loading state
    setState(() {
      _isLoading = true;
    });

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // Simulate success/failure based on code
      if (code == '1234') {
        // Success case
        await AppLocalStorage.setLoginStatus(true);

        if (mounted) {
          await _showCenterMessage('Muvaffaqiyatli kirish!',
              backgroundColor: Colors.green);
          // Small delay to show success message
          await Future.delayed(const Duration(milliseconds: 500));
          context.go(AppRoutes.home);
        }
      } else {
        // Invalid code case
        if (mounted) {
          await _showCenterMessage('Noto\'g\'ri kod kiritildi');
          _codeController.clear();
        }
      }
    } catch (e) {
      if (mounted) {
        await _showCenterMessage('Xatolik yuz berdi, qaytadan urinib ko\'ring');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _onTimerRestart() {
    // Show confirmation message
    _showCenterMessage(
      'Kod qayta yuborildi',
      backgroundColor: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.secondaryColor,
      ),
      body: Container(
        width: double.infinity,
        color: AppColors.secondaryColor,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const AppLogo(
                img: 'assets/images/logo_secondary.png',
                width: 168,
                height: 63,
              ),
              const SizedBox(height: 39),
              const AppText(
                text: 'Kirish',
                color: AppColors.greyscaleDarkColor,
                size: 30,
                font: FontWeight.bold,
              ),
              const SizedBox(height: 39),
              Row(
                children: [
                  const Flexible(
                    child: AppText(
                      text: 'Biz kodni ushbu raqamga jo\'natdik: ',
                      color: AppColors.greyscaleColor,
                      size: 13,
                    ),
                  ),
                  const AppText(
                    text: ' +998 99 155 15 25',
                    color: AppColors.greyscaleDarkColor,
                    size: 13,
                    font: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(height: 39),
              NumberInput(
                controller: _codeController,
                readOnly: _isLoading,
                textInputAction: TextInputAction.next,
                // onSubmitted o'chirildi - faqat button orqali submit
              ),
              const SizedBox(height: 39),
              const AppText(
                text: 'Kodni qabul qilmadingizimi?',
                color: AppColors.greyscaleColor,
                size: 15,
              ),
              const SizedBox(height: 39),
              TimerWidget(
                initialDuration: const Duration(minutes: 1),
                onRestartTap: _onTimerRestart,
                timerText: 'Qayta jo\'natish',
                restartText: 'Qayta yuborish',
              ),
              const SizedBox(height: 39),
              PrimaryButton(
                label: _isLoading ? 'Tekshirilmoqda...' : 'Tasdiqlash',
                onPressed: _isLoading ? null : _onConfirmPressed,
              ),
              const SizedBox(height: 39),
              const LineText(label: 'Yoki bilan davom etish'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Google sign in tapped');
                    },
                    child: const AppIcons(
                      iconPath: 'assets/images/google_icon.png',
                      decoration: BoxDecoration(),
                      width: 87,
                      height: 60,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      print('Apple sign in tapped');
                    },
                    child: const AppIcons(
                      iconPath: 'assets/images/apple_icon.png',
                      decoration: BoxDecoration(),
                      width: 87,
                      height: 60,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 39),
              BottomTextButton(onTap: () => context.push(AppRoutes.signUp)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
