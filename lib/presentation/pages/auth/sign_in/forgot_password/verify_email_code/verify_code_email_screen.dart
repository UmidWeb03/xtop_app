import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/input/number_input.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';
import 'package:xtop_app/presentation/organisms/timer/timer_section.dart';

class VerifyEmailCodeScreen extends StatelessWidget {
  const VerifyEmailCodeScreen({super.key});

  static final TextEditingController _codeController = TextEditingController();

  void _onConfirmPressed() {}

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
              text: 'Kod umid***@gmail.com manziliga jo\'natildi',
              color: Colors.black87,
              size: 16,
            ),
            const SizedBox(height: 85),
            NumberInput(
              controller: _codeController,
              readOnly: false,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _onConfirmPressed(),
            ),
            const SizedBox(height: 85),
            const TimerWidget(
              initialDuration: Duration(seconds: 30),
              restartText: 'Qayta yuborish',
            ),
            const SizedBox(height: 97),
            PrimaryButton(
              label: 'Tasdiqlash',
              onPressed: _onConfirmPressed,
            ),
          ],
        ),
      ),
    );
  }
}
