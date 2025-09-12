import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/core/services/local_storage.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/input/number_input.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';
import 'package:xtop_app/presentation/organisms/timer/timer_section.dart';

class VerifyPhoneCodeScreen extends StatefulWidget {
  const VerifyPhoneCodeScreen({super.key});

  @override
  State<VerifyPhoneCodeScreen> createState() => _VerifyPhoneCodeScreenState();
}

class _VerifyPhoneCodeScreenState extends State<VerifyPhoneCodeScreen> {
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
        title: const AppText(
          text: 'Parolingizni unutdingizmi?',
          color: Colors.black,
          size: 20,
          font: FontWeight.bold,
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppText(
              text: 'Kod +998 77 *** ** 99 raqamiga jo\'natildi',
              color: Colors.black87,
              size: 16,
            ),
            const SizedBox(height: 85),
            NumberInput(
              controller: _codeController,
              readOnly: _isLoading,
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {
                if (!_isLoading) {
                  _onConfirmPressed();
                }
              },
            ),
            const SizedBox(height: 85),
            TimerWidget(
              initialDuration: const Duration(seconds: 30),
              timerText: 'Kod qayta yuborildi',
              restartText: 'Qayta yuborish',
              onRestartTap: _onTimerRestart,
            ),
            const SizedBox(height: 97),
            PrimaryButton(
              label: _isLoading ? 'Tekshirilmoqda...' : 'Tasdiqlash',
              onPressed: () {
                if (_isLoading) return;
                _onConfirmPressed();
              },
            ),
          ],
        ),
      ),
    );
  }
}
