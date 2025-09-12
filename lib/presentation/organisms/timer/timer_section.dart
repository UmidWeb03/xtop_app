import 'package:flutter/material.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';

class TimerWidget extends StatefulWidget {
  final Duration initialDuration;
  final VoidCallback? onRestartTap;
  final String timerText;
  final String restartText;

  const TimerWidget({
    super.key,
    this.initialDuration = const Duration(minutes: 1),
    this.onRestartTap,
    this.timerText = 'Qayta jo\'natish',
    this.restartText = 'Qayta yuborish',
  });

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget>
    with TickerProviderStateMixin {
  late AnimationController _timerController;
  late Duration _currentDuration;

  @override
  void initState() {
    super.initState();
    _currentDuration = widget.initialDuration;
    _startTimer();
  }

  @override
  void dispose() {
    _timerController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timerController = AnimationController(
      duration: _currentDuration,
      vsync: this,
    );
    _timerController.forward();
  }

  void _restartTimer() {
    _timerController.reset();
    setState(() {
      _currentDuration = widget.initialDuration;
    });
    _timerController.duration = _currentDuration;
    _timerController.forward();

    // Call the provided callback
    widget.onRestartTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _timerController,
      builder: (context, child) {
        final remaining = _currentDuration * (1 - _timerController.value);
        final seconds = remaining.inSeconds;

        if (seconds > 0) {
          return AppText(
            text: '${widget.timerText} ${seconds.toString().padLeft(2, '0')} s',
            color: Colors.grey[600]!,
            size: 16,
          );
        } else {
          return InkWell(
            onTap: _restartTimer,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: AppText(
                text: widget.restartText,
                color: Theme.of(context).primaryColor,
                size: 16,
                font: FontWeight.w600,
              ),
            ),
          );
        }
      },
    );
  }
}
